import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/core/services/api/http_requests.dart';
import 'package:bkapp_flutter/environment_config.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:easy_permission_validator/easy_permission_validator.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import '../../../widgets.dart';
import 'package:http/http.dart' as http;


// ignore: must_be_immutable
class ContactList extends StatefulWidget {
  ContactList({Key key,
     this.customContext, 
     this.isRegister, 
     @required this.tokenUser , 
     this.partnerList,
     })
      : super(key: key);

  final BuildContext customContext;
  final bool isRegister;
  final String tokenUser;
  List<CustomContact> contactsList = [];
  List<CustomContact> selectContact = [];
  final List<PartnerModel> partnerList;

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  TextEditingController searchController = new TextEditingController();
  Offset position = Offset(20.0, 20.0);
  IconData icon;

  bool isLoadingContactList = true;


  @override
  void initState() {
    _populateContacts();
    super.initState();
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
              child: !isLoadingContactList ? ListView.builder(
                  key: Key('list_view_builder_contacts'),
                  shrinkWrap: true,
                  itemCount: filterContactNull(widget.contactsList).length,
                  itemBuilder: (BuildContext context, int index) {
                    CustomContact _contact = filterContactNull(widget.contactsList)[index];
                    List<Item> _phoneList = _contact.contact.phones.toList();
                    return _buildListTile(_contact, _phoneList,);
                  }) :  Center(
                      child: Container(
                        child: CircularProgressIndicator(),
                    ),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.0),
              child: RaisedButton(
                key: Key('raisedButton-accept'),
                onPressed: 
                    widget.selectContact.length >= 1
                    ? () => _submitContacts(context)
                    : () => Navigator.pop(context),

                color: Theme.of(context).colorScheme.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text(
                  widget.selectContact.length >= 1
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

  Widget _buildListTile(CustomContact c, List<Item> list ) {

    return 
      ListTile(
        title: Text(c.contact.displayName),
        subtitle: Text(list[0].value),
        leading: CircleAvatar(child: Text(c.contact.initials())),
        //aca está el checkbox
        trailing:         Checkbox(
          value: c.isChecked,
          onChanged: (bool value) {
          if (!c.isChecked) {
            setState(() => widget.selectContact.add(c));
          } else {
            setState(() => widget.selectContact.remove(c));
          }
          setState(() => c.isChecked = value);
        }
      )
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

    final contacts = 
      await ContactsService.getContacts(
        photoHighResolution: false , 
        withThumbnails: false , 
        iOSLocalizedLabels: false , 
        androidLocalizedLabels: false
      );

    final List<Contact> _contactsList = []; 

    contacts.forEach((contact) {
      
      if(contact.phones.isNotEmpty ){
        _contactsList.add(contact);
      }      
    });

    widget.contactsList = _contactsList
        .map((contact) => CustomContact(contact: contact))
        .toList();
      
    // UnAutorised contaad that constain in partners list
    final List<String> allPartnersPhones = [];
    final List<String> allContactPhones = [];

    widget.partnerList.forEach((partneR) { 
      allPartnersPhones.add(partneR.phone);
    });

    // clean contact numbers
    widget.contactsList.forEach((partner) { 
      allContactPhones
        .add(partner.contact.phones.elementAt(0).value.replaceAll(
            RegExp(r'[!@#<>?":_`~;[\]\\|=+-\s\b|\b\s]'), '')
        );
    });

    // remove contact that is in partnerList
    for (var i = 0; i < widget.contactsList.length; i++) {
      if( allPartnersPhones.contains(allContactPhones[i])){
        widget.contactsList.removeAt(i);
      }
    }

    setState(() {
      isLoadingContactList = false;
    });
  
  }

  void _submitContacts(BuildContext context) async {

    print(widget.selectContact.asMap());

    final List<Map<String, dynamic>> partnerBody = [];

    widget.selectContact.forEach((contact) {
      partnerBody.add({
        "name": contact.contact.displayName,
        "phone": contact.contact.phones.elementAt(0).value
      });
    });

    print('************* token *************');
    print(widget.tokenUser);

    final res = await postInvitePartner(widget.tokenUser, partnerBody);

    print(res);

    Navigator.pop(context);
    Navigator.pop(context);
    setState(() {});
  }
}

Future<Map<String, dynamic>> postInvitePartner(
  String token, List<Map<String, dynamic>> partners) async {

  http.Client httpClient = http.Client();
  HttpRequests _httpRequest = HttpRequests();
  final postInvitePartner = ApiEndpoints.postInvitePartner();
  return await _httpRequest.post(
    httpClient: httpClient,
    url: postInvitePartner,
    token: token,
    body: {"partners": partners}
  );
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

