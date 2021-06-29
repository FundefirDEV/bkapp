import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:easy_permission_validator/easy_permission_validator.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
//import 'package:flutter_contact/contacts.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../widgets.dart';

class ContactList extends StatefulWidget {
  ContactList({Key key, this.customContext, this.isRegister, this.tokenUser})
      : super(key: key);

  final BuildContext customContext;
  final bool isRegister;
  final String tokenUser;

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> _contactsList = List<Contact>();
  List<CustomContact> _uiCustomContacts = List<CustomContact>();
  List<CustomContact> _uiFilteredContacts = List<CustomContact>();
  List<CustomContact> _allContacts = List<CustomContact>();
  TextEditingController searchController = new TextEditingController();
  Offset position = Offset(20.0, 20.0);

  bool _isSelectedContactsView = false;
  String floatingButtonLabel;
  Color floatingButtonColor;
  IconData icon;
  List<CustomContact> _selectedContacts = new List();

  @override
  void initState() {
    super.initState();
    refreshContacts();
    searchController.addListener(() => filterContacts());
  }

  filterContacts() {
    List<CustomContact> _c = [];
    _c.addAll(_uiCustomContacts);
    if (searchController.text.isNotEmpty) {
      _c.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String contactName = contact.contact.displayName.toLowerCase();
        return contactName.contains(searchTerm);
      });
      setState(() => _uiFilteredContacts = _c);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    return Stack(
      children: [
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: TextField(
                  key: Key('textfield_search'),
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: I18n.of(context).actionTextSearch,
                    border: new OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                          Theme.of(context).colorScheme.primaryColor)),
                    prefixIcon: Icon(Icons.search)),
                ),
              ),
            ),
            Expanded(
              // aca está la lista
              child: ListView.builder(
                  key: Key('list_view_builder_contacts'),
                  shrinkWrap: true,
                  itemCount: isSearching == true
                      ? filterContactNull(_uiFilteredContacts).length
                      : filterContactNull(_uiCustomContacts).length,
                  itemBuilder: (BuildContext context, int index) {
                    CustomContact _contact = isSearching == true
                        ? filterContactNull(_uiFilteredContacts)[index]
                        : filterContactNull(_uiCustomContacts)[index];
                    List<Item> _phoneList = _contact.contact.phones.toList();
                    return _buildListTile(_contact, _phoneList,
                        BlocProvider.of<PartnerBloc>(context));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.0),
              child: RaisedButton(
                key: Key('raisedButton-accept'),
                onPressed: _selectedContacts.length >= 1
                    ? () => _submitContacts(context)
                    : () => Navigator.pop(context),
                color: Theme.of(context).colorScheme.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text(
                  _selectedContacts.length >= 1
                      ? I18n.of(context).actionTextAdd
                      : I18n.of(context).actionTextClose,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    letterSpacing: 3.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        MenuRequests(
            position: position,
            onDragEnd: (details) {
              setState(() => position = details.offset);
            })
      ],
    );
  }

  Widget _buildListTile(
      CustomContact c, List<Item> list, PartnerBloc partnerBloc) {
    return BlocListener<PartnerBloc, PartnerState>(
      listener: (context, state) {
        if (state is PartnerUnauthorized &&
            state.phoneNumber == list[0].value) {
          c.isChecked = false;
          setState(() => _selectedContacts.remove(c));
        }
      },
      child: ListTile(
          title: BlocBuilder<PartnerBloc, PartnerState>(
            builder: (context, state) {
              if (state is PartnerUnauthorized &&
                  state.phoneNumber == list[0].value
                  && c.contact.displayName != null) {
                c.isUnAuthorized = true;
              }
              if (c.isUnAuthorized) return Text('Ya esta en un bkgrupo');

              // a veces es nulo !
              return Text(c.contact.displayName);
            },
          ),
          subtitle: list.length >= 1 && list[0]?.value != null
              ? Text(list[0].value)
              : Text('.'),
          leading: (c.contact.avatar != null && c.contact.avatar.length > 0 && c.contact.initials() != null)
              ? CircleAvatar(backgroundImage: MemoryImage(c.contact.avatar))
                                          // a veces es nulo !
              : CircleAvatar(child: Text(c.contact.initials())),
          trailing:
              BlocBuilder<PartnerBloc, PartnerState>(builder: (context, state) {
            if (state is PartnerUnauthorized &&
                state.phoneNumber == list[0].value) {
              c.isUnAuthorized = true;
            }
            if (c.isUnAuthorized) return Icon(Icons.close);
            return Checkbox(
                value: c.isChecked,
                onChanged: (bool value) {
                  if (!c.isChecked) {
                    partnerBloc.add(JustValidatePartner(
                        token: widget.tokenUser,
                        name: c.contact.displayName,
                        phoneNumber: list[0]?.value));
                    setState(() => _selectedContacts.add(c));
                  } else {
                    setState(() => _selectedContacts.remove(c));
                  }
                  setState(() => c.isChecked = value);
                });
          })),
    );
  }

  refreshContacts() async {
    final permissionValidator = EasyPermissionValidator(
      context: context,
      appName: 'Bkapp',
    );
    var result = await permissionValidator.contacts();

    if (result) {
      _populateContacts();
    } else {
      Navigator.pop(context);
    }
  }

  _populateContacts() async {

    // await Contacts.streamContacts( 
    //         withThumbnails: false, sortBy: ContactSortOrder.firstName() , withHiResPhoto: false)
    //     .forEach((contact) {
    //   print(contact.toString());
    //   _contactsList.add(contact);
    // });
    print('cargando contactos...');
    final contacts = 
      await ContactsService.getContacts(
        photoHighResolution: false , 
        withThumbnails: false , 
        iOSLocalizedLabels: false , 
        androidLocalizedLabels: false
      ); 

    contacts.forEach((contact) {
      _contactsList.add(contact);
    });

    print('******************** contacts ********************');
    print(_contactsList.asMap());
    print('******************** contacts ********************');

    _allContacts = _contactsList
        .map((contact) => CustomContact(contact: contact))
        .toList();
    setState(() => _uiCustomContacts = _allContacts);
  }

  void _submitContacts(BuildContext context) {
    setState(() {
      if (!_isSelectedContactsView) {
        _uiCustomContacts =
            _allContacts.where((contact) => contact.isChecked == true).toList();
        var contactSelected = _uiCustomContacts.map((e) {
          BlocProvider.of<PartnerBloc>(context).add(AddPartnerToDb(
              token: widget.tokenUser,
              name: e.contact.displayName,
              phoneNumber: e.contact.phones.elementAt(0).value,
              isRegister: widget.isRegister));
          return {
            'name': e.contact.displayName,
            'phone': e.contact.phones.elementAt(0).value
          };
        }).toList();
        _isSelectedContactsView = true;
        Navigator.pop(context, contactSelected);
      } else {
        _uiCustomContacts = _allContacts;
        _isSelectedContactsView = false;
      }
    });
  }
}

class CustomContact {
  final Contact contact;
  bool isChecked;
  bool isUnAuthorized;

  CustomContact(
      {this.contact, this.isChecked: false, this.isUnAuthorized: false});
}

  List<CustomContact> filterContactNull(List<CustomContact> listContact){

    return listContact.where((contact) => contact?.contact?.displayName != null ).toList();

  }

