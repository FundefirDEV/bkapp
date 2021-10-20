import 'package:bkapp_flutter/core/bloc/adminCreateBank/admin_create_bank_form_bloc.dart';
import 'package:bkapp_flutter/core/models/adminModels/admin_create_bank_user_model.dart';
import 'package:bkapp_flutter/core/models/dropdown_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/errorHandler/error_handler.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AdminCreateBankScreenContainer extends StatelessWidget {
  AdminCreateBankScreenContainer({@required this.isAdmin});

  final bool isAdmin;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    AdminCreateBankFormBloc adminCreateBankFormBloc =
        context.watch<AdminCreateBankFormBloc>();

    adminCreateBankFormBloc.updateUserList(adminCreateBankFormBloc.userList);

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
          addPartnerButton(context, adminCreateBankFormBloc),
          partnerList(adminCreateBankFormBloc)
        ]));
  }

  StreamBuilder<Object> partnerList(
      AdminCreateBankFormBloc adminCreateBankFormBloc) {
    return StreamBuilder<Object>(
        stream: adminCreateBankFormBloc.userListStream,
        builder: (context, AsyncSnapshot snapshot) {
          return Column(
            children: [
              for (var i = 0; i < snapshot.data.length; i++)
                Container(
                  width: SizeConfig.blockSizeHorizontal * 60,
                  child: userListItem(
                      context, snapshot.data[i], adminCreateBankFormBloc, i),
                ) //userListItem(context, user),
            ],
          );
        });
  }

  Widget userListItem(BuildContext context, AdminCreateBankUser user,
      AdminCreateBankFormBloc adminCreateBankFormBloc, int index) {
    return Stack(
      key: Key('first-stack-partner-card'),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                key: Key('second-stack-partner-card'),
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/user_icon_yellow.svg',
                    width: SizeConfig.safeBlockHorizontal * 10,
                  ),
                  Positioned(
                      bottom: 15.0, right: 10.0, child: _dataPartner(user))
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: -5.0,
            right: -9.0,
            child: RawMaterialButton(
              onPressed: () => {adminCreateBankFormBloc.deletePartner(index)},
              elevation: 4.0,
              constraints: BoxConstraints(minWidth: 23.0, minHeight: 23.0),
              shape: CircleBorder(),
              fillColor: Colors.white,
              child: Icon(Icons.close,
                  size: 17.0, color: Theme.of(context).colorScheme.errorColor),
            )),
      ],
    );
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

  Widget _dataPartner(AdminCreateBankUser user) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: SizeConfig.safeBlockHorizontal * 40,
            child: Text(
              user.firstname,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                height: 1,
                fontSize: SizeConfig.safeBlockHorizontal * 6,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Text(
            user.phone,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4),
          )
        ],
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
            height: SizeConfig.blockSizeVertical * 80,
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
                          textFieldBloc: adminCreateBankFormBloc.firtsName,
                          errorBuilder: (context, string) =>
                              I18n.of(context).errorRequired,
                          decoration: InputDecoration(
                              labelText: I18n.of(context).formFirstName,
                              prefixIcon: Icon(Icons.account_circle))),
                      TextFieldBlocBuilder(
                          textFieldBloc: adminCreateBankFormBloc.lastName,
                          errorBuilder: (context, string) =>
                              I18n.of(context).errorRequired,
                          decoration: InputDecoration(
                              labelText: I18n.of(context).formSecondName,
                              prefixIcon: Icon(Icons.account_circle_outlined))),
                      TextFieldBlocBuilder(
                          textFieldBloc: adminCreateBankFormBloc.email,
                          errorBuilder: errorHandler,
                          decoration: InputDecoration(
                              labelText: I18n.of(context).formEmail,
                              prefixIcon: Icon(Icons.email_sharp))),
                      TextFieldBlocBuilder(
                          textFieldBloc: adminCreateBankFormBloc.phone,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                          ],
                          errorBuilder: errorHandler,
                          decoration: InputDecoration(
                              labelText: I18n.of(context).inviteModalCellPhone,
                              prefixIcon: Icon(Icons.phone))),
                      TextFieldBlocBuilder(
                          textFieldBloc: adminCreateBankFormBloc.documenNumber,
                          errorBuilder: (context, string) =>
                              I18n.of(context).errorRequired,
                          decoration: InputDecoration(
                              labelText: I18n.of(context).profileScreenId,
                              prefixIcon: Icon(Icons.badge))),
                      CheckboxFieldBlocBuilder(
                        booleanFieldBloc: adminCreateBankFormBloc.isAdmin,
                        body: Container(
                          child: Text('admin'),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextButton(
                          onPressed: () async {
                            if (adminCreateBankFormBloc.state.isValid()) {
                              print('valid');
                              await adminCreateBankFormBloc.addUser(context);
                            }
                          },
                          child: Container(
                              width: 250,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(45)),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryColor[100]),
                              child: Center(
                                  child: Text(
                                I18n.of(context).actionTextAdd,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ))),
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
