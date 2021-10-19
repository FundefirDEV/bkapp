import 'dart:async';

import 'package:bkapp_flutter/core/bloc/adminCreateBank/admin_create_bank_form_bloc.dart';
import 'package:bkapp_flutter/core/models/dropdown_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/menuNavigator/widgets/widgets.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/errorHandler/error_handler.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AdminCreateBankScreenContainer extends StatelessWidget {
  AdminCreateBankScreenContainer({@required this.isAdmin});

  final bool isAdmin;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    AdminCreateBankFormBloc adminCreateBankFormBloc =
        context.read<AdminCreateBankFormBloc>();
    return Container(
        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
        child: Column(children: [
          TitleCard(),
          SelectItemContainer(
            selectFieldBloc: adminCreateBankFormBloc.countryList,
            title: 'Select country',
            borderRadius: null,
          ),
          SelectItemContainer(
            selectFieldBloc: adminCreateBankFormBloc.departamentList,
            title: 'Select departament',
            borderRadius: null,
          ),
          SelectItemContainer(
            selectFieldBloc: adminCreateBankFormBloc.cityList,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            title: 'Select city',
          ),
          addPartnerButton(context, adminCreateBankFormBloc)
        ]));
  }

  GestureDetector addPartnerButton(
      BuildContext context, AdminCreateBankFormBloc adminCreateBankFormBloc) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (_) => AddUserForm(
                adminCreateBankFormBloc: adminCreateBankFormBloc,
              )),
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                child: Text(
                  'Add partner',
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 5,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            Container(
              child: Icon(
                Icons.add_circle,
                color: Theme.of(context).colorScheme.primaryColor[100],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectItemContainer extends StatelessWidget {
  const SelectItemContainer(
      {Key key,
      @required this.selectFieldBloc,
      @required this.title,
      @required this.borderRadius})
      : super(key: key);

  final SelectFieldBloc selectFieldBloc;
  final String title;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 100,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 45.0, right: 25.0),
      decoration:
          BoxDecoration(borderRadius: borderRadius, color: Colors.white),
      child: DropdownFieldBlocBuilder<DropDownModel>(
          key: Key('list-state-kgh'),
          showEmptyItem: false,
          selectFieldBloc: selectFieldBloc,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: title,
              suffixIcon: Icon(Icons.keyboard_arrow_down,
                  size: 32.0,
                  color: Theme.of(context).colorScheme.primaryColor[100])),
          itemBuilder: (context, value) => value.text),
    );
  }
}

class AddUserForm extends StatelessWidget {
  const AddUserForm({Key key, this.adminCreateBankFormBloc}) : super(key: key);

  final AdminCreateBankFormBloc adminCreateBankFormBloc;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: SizeConfig.blockSizeHorizontal * 80,
            height: SizeConfig.blockSizeVertical * 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      TextFieldBlocBuilder(
                          textFieldBloc: adminCreateBankFormBloc.userName,
                          //onChanged: (value) => _isEmpty(widget.inviteBloc),
                          errorBuilder: (context, string) =>
                              I18n.of(context).errorRequired,
                          decoration: InputDecoration(
                              labelText: I18n.of(context).formFirstName,
                              prefixIcon: Icon(Icons.account_circle))),
                      TextFieldBlocBuilder(
                          textFieldBloc: adminCreateBankFormBloc.email,
                          //onChanged: (value) => _isEmpty(widget.inviteBloc),
                          errorBuilder: (context, string) =>
                              I18n.of(context).errorRequired,
                          decoration: InputDecoration(
                              labelText: I18n.of(context).formEmail,
                              prefixIcon: Icon(Icons.email_sharp))),
                      TextFieldBlocBuilder(
                          textFieldBloc: adminCreateBankFormBloc.phone,
                          //onTap: () => _isEmpty(widget.inviteBloc),
                          //onChanged: (value) => _isEmpty(widget.inviteBloc),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            //PhoneFormatter()
                          ],
                          errorBuilder: errorHandler,
                          decoration: InputDecoration(
                              labelText: I18n.of(context).inviteModalCellPhone,
                              prefixIcon: Icon(Icons.phone))),
                      TextFieldBlocBuilder(
                          textFieldBloc: adminCreateBankFormBloc.documenNumber,
                          //onChanged: (value) => _isEmpty(widget.inviteBloc),
                          errorBuilder: (context, string) =>
                              I18n.of(context).errorRequired,
                          decoration: InputDecoration(
                              labelText: I18n.of(context).profileScreenId,
                              prefixIcon: Icon(Icons.perm_identity))),
                      CheckboxFieldBlocBuilder(
                        booleanFieldBloc: adminCreateBankFormBloc.isAdmin,
                        body: Text('admin'),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextButton(
                          onPressed: () {
                            adminCreateBankFormBloc.addUser();
                          },
                          child: Container(
                              width: 250,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(45)),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryColor[100]),
                              child: Center(
                                child: Text(
                                  'Add',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

class TitleCard extends StatelessWidget {
  const TitleCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Theme.of(context).colorScheme.primaryColor[100]),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Create a new Bank !',
            style: TextStyle(
                fontFamily: 'nunito',
                color: Colors.white,
                fontSize: SizeConfig.blockSizeHorizontal * 6,
                fontWeight: FontWeight.w100,
                letterSpacing: 2),
          ),
        ]));
  }
}
