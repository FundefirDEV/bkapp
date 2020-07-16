import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

ContactList pageState;

class ContactList extends StatefulWidget {
  ContactList({Key key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> _contacts = new List<Contact>();
  List<CustomContact> _uiCustomContacts = List<CustomContact>();
  List<CustomContact> _uiFilteredContacts = List<CustomContact>();
  List<CustomContact> _allContacts = List<CustomContact>();
  TextEditingController searchController = new TextEditingController();

  bool _isSelectedContactsView = false;
  String floatingButtonLabel;
  Color floatingButtonColor;
  IconData icon;

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
    return Column(
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
                          color: Theme.of(context).colorScheme.primaryColor)),
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              key: Key('list_view_builder_contacts'),
              shrinkWrap: true,
              itemCount: isSearching == true
                  ? _uiFilteredContacts?.length
                  : _uiCustomContacts.length,
              itemBuilder: (BuildContext context, int index) {
                CustomContact _contact = isSearching == true
                    ? _uiFilteredContacts[index]
                    : _uiCustomContacts[index];
                List<Item> _phoneList = _contact.contact.phones.toList();
                return _buildListTile(_contact, _phoneList);
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0),
          child: RaisedButton(
            key: Key('raisedButton-accept'),
            onPressed: () => _submitContacts(context),
            color: Theme.of(context).colorScheme.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: Text(
              I18n.of(context).actionTextAdd,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
                letterSpacing: 3.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListTile(CustomContact c, List<Item> list) {
    return ListTile(
      title: Text(c.contact.displayName),
      subtitle: list.length > 1 && list[0]?.value != null
          ? Text(list[0].value)
          : Text(''),
      leading: (c.contact.avatar != null && c.contact.avatar.length > 0)
          ? CircleAvatar(backgroundImage: MemoryImage(c.contact.avatar))
          : CircleAvatar(child: Text(c.contact.initials())),
      trailing: Checkbox(
          value: c.isChecked,
          onChanged: (bool value) {
            setState(() => c.isChecked = value);
          }),
    );
  }

  refreshContacts() async {
    await Permission.contacts.request();
    if (await Permission.contacts.status.isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      _populateContacts(contacts);
    } else {
      Navigator.pop(context);
    }
  }

  _populateContacts(Iterable<Contact> contacts) {
    _contacts = contacts.where((item) => item.displayName != null).toList();
    _contacts.sort((a, b) => a.displayName.compareTo(b.displayName));

    _allContacts =
        _contacts.map((contact) => CustomContact(contact: contact)).toList();
    setState(() => _uiCustomContacts = _allContacts);
  }

  void _submitContacts(BuildContext context) {
    setState(() {
      if (!_isSelectedContactsView) {
        _uiCustomContacts =
            _allContacts.where((contact) => contact.isChecked == true).toList();
        var contactSelected = _uiCustomContacts
            .map((e) => {
                  'name': e.contact.displayName,
                  'phone': e.contact.phones.elementAt(0).value
                })
            .toList();
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

  CustomContact({this.contact, this.isChecked: false});
}
