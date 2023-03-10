import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/core/services/api/http_requests.dart';
import 'package:bkapp_flutter/environment_config.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:easy_permission_validator/easy_permission_validator.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:http/http.dart' as http;


// ignore: must_be_immutable
class ContactListRegisterBank extends StatefulWidget {
  ContactListRegisterBank({Key key,
     this.customContext, 
     this.isRegister, 
     @required this.tokenUser , 
     this.partnerList,
     @required this.menuNavigatorBloc,
     @required this.addPartnerForm,
     })
      : super(key: key);

  final MenuNavigatorBloc menuNavigatorBloc;
  final BuildContext customContext;
  final bool isRegister;
  final String tokenUser;
  List<CustomContact> contactsList = [];
  List<CustomContact> selectContact = [];
  final List<PartnerModel> partnerList;
  final  Function addPartnerForm;

  @override
  _ContactListRegisterBankState createState() => _ContactListRegisterBankState(selectContact: this.selectContact);
}

class _ContactListRegisterBankState extends State<ContactListRegisterBank> {

  _ContactListRegisterBankState({this.selectContact});
  TextEditingController searchController = new TextEditingController();
  Offset position = Offset(20.0, 20.0);
  IconData icon;
  bool isLoadingContactList = true;
  List<CustomContact> contactsList = [];
  List<CustomContact> allContactsList = [];
  List<CustomContact> selectContact = [];


  @override
  void initState() {
    refreshContacts();
    super.initState();
  }

    filterContacts(String value) {

    List<CustomContact> _c = [];
    _c.addAll(allContactsList);
    if (value.isNotEmpty) {      
      _c.retainWhere((contact) {
        String searchTerm = value.toLowerCase();
        String contactName = contact.contact.displayName.toLowerCase();
        return contactName.contains(searchTerm);
      });
      setState(() => contactsList = _c);
    }
  }


  @override
  Widget build(BuildContext context) {

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
                onChanged: (value)=> filterContacts(value),
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
            // aca est?? la lista
            child: !isLoadingContactList ? ListView.builder(
                key: Key('list_view_builder_contacts'),
                shrinkWrap: true,
                itemCount: filterContactNull(contactsList).length,
                itemBuilder: (BuildContext context, int index) {
                  CustomContact _contact = filterContactNull(contactsList)[index];
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
                  selectContact.length >= 1
                  ? () => _submitContacts(context)
                  : () => Navigator.pop(context),

              color: Theme.of(context).colorScheme.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Text(
                selectContact.length >= 1
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
        //aca est?? el checkbox
        trailing:         Checkbox(
          value: c.isChecked,
          onChanged: (bool value) {
          if (!c.isChecked) {
            setState(() => selectContact.add(c));
          } else {
            setState(() => selectContact.remove(c));
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

    contactsList = _contactsList
        .map((contact) => CustomContact(contact: contact))
        .toList();
      
    // UnAutorised contaad that constain in partners list
    final List<String> allPartnersPhones = [];

    widget.partnerList.forEach((partneR) { 
      allPartnersPhones.add(partneR.phone.replaceAll(
            RegExp(r'[!@#<>?":_`~;[\]\\|=+-\s\b|\b\s]'), ''));
    });

    // clean contact numbers
    contactsList.forEach((contact) {
      final cleanPhone =  contact.contact.phones.elementAt(0).value.replaceAll(
            RegExp(r'[!@#<>?":_`~;[\]\\|=+-\s\b|\b\s]'), '');
      contact.clearPhone = cleanPhone;     
    });

    contactsList.removeWhere(
      (contact) => allPartnersPhones.contains(contact.clearPhone)
    );


    setState(() {
      isLoadingContactList = false;
      allContactsList = contactsList;
    });
  }

  _submitContacts(BuildContext context) async {

    final List<String> allPhones = [];

    selectContact.forEach((c) { 
      allPhones.add(
        c.contact.phones.elementAt(0).value.replaceAll(RegExp(r'[()!@#<>?":_`~;[\]\\|=+-\s\b|\b\s]'), '')
      );
    });

    try {

      final res = await validateAllPhones(widget.tokenUser , allPhones);
      print(res);

      final List<PartnerModel> partnerList = [];

      selectContact.forEach((contact) { 
        partnerList.add(PartnerModel(
          firstname: contact.contact.displayName,
          phone : contact.contact.phones.elementAt(0).value.replaceAll(RegExp(r'[()!@#<>?":_`~;[\]\\|=+-\s\b|\b\s]'), '')
        ));
      });

      widget.addPartnerForm(partnerList);

      selectContact = [];
      Navigator.pop(context);
      Navigator.pop(context);


    } catch (e) {
      _showDialog(context , e.toString());      
    }

    _clearCheckbox();
  }


  void _clearCheckbox(){

    contactsList.forEach((contact) { 
      contact.isChecked = false;
    });
    
    setState(() {selectContact = [];});
  }
}


Future<String> validateAllPhones(
  String token, List<String> phoneList) async {

  http.Client httpClient = http.Client();
  HttpRequests _httpRequest = HttpRequests();
  final postInvitePartner = ApiEndpoints.validateAllPhone();
  return await _httpRequest.post(
    httpClient: httpClient,
    url: postInvitePartner,
    token: token,
    body: phoneList
  );
}


void _showDialog(context , String error) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (_) {
      return ImageBottomModal(
        modalHeight: 45.0,
        image: 'assets/images/sad_bot.svg',
        title: I18n.of(context).requestErrorUserNotAvailable,
        isBold: true,
        isBtnAccept: false,
        isImageBg: false,
        titleCloseButton: I18n.of(context).administratorAssignmentClose,
        onPressCancel: ()=> Navigator.pop(context),
        technicalData: error,
    );
  });
}

class CustomContact {
  final Contact contact;
  bool isChecked;
  bool isUnAuthorized;
  String clearPhone;

  CustomContact(
    {this.contact, this.isChecked: false, this.isUnAuthorized: false , this.clearPhone});
}
  List<CustomContact> filterContactNull(List<CustomContact> listContact){
  return listContact.where((contact) => contact?.contact?.displayName != null ).toList();
}

