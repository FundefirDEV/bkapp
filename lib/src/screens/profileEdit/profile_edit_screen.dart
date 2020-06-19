import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/profileEdit/content/profile_edit_text_fields.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'content/top_container_edit_profile_screen.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
class ProfileEditScreen extends StatefulWidget {
  ProfileEditScreen({Key key}) : super(key: key);

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  SchollarshipAndProfession schollarshipAndProfession =
      SchollarshipAndProfession();
  IdAndBirthdateTextField idBirthDate = IdAndBirthdateTextField();
  LastNameAndEmail lastNameAndEmail = LastNameAndEmail();
  NameAndCellphone nameAndCellphone = NameAndCellphone();
  TopContainerEditProfileScreen topContainer =
      new TopContainerEditProfileScreen();
      UpdateButton updateButton = UpdateButton();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: Key('Scaffold_profile_edit_screen'),
      body: SafeArea(
          child: Column(
        key: Key('Main_column_profile_edit_screen'),
        children: <Widget>[
          Container(
            color: Colors.grey[300],
            child: Container(
                color: Colors.grey[300],
                child: topContainer.topContainer(context)),
          ),
          Flexible(
            child: Container(
              key: Key('Container_textFields_profile_edit_screen'),
              height: SizeConfig.safeBlockVertical * 60,
              color: Colors.grey[300],
              child: Container(
                child: SingleChildScrollView(
                  key: Key('ScrollView_profile_edit_screen'),
                  child: Column(
                    key: Key('Column_textFields_profile_edit_screen'),
                    children: <Widget>[
                      Row(
                        key: Key('Row_textFields_profile_edit_screen'),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          nameAndCellphone,
                          lastNameAndEmail,
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 3),
                          child: Row(
                            key: Key('Row_textFields_profile_edit_screen'),
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              idBirthDate,
                              schollarshipAndProfession
                            ],
                          )),
                      SizedBox(height: SizeConfig.blockSizeVertical * 6),
                      updateButton
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class UpdateButton extends StatelessWidget {
  const UpdateButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('Container_update_button_profile_edit_screen'),
      height: SizeConfig.blockSizeVertical * 5,
      width: SizeConfig.blockSizeHorizontal * 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Theme.of(context).colorScheme.primaryColor),
      child: FlatButton(
        key: Key('flatButton_profile_edit_screen'),
        onPressed: context.bloc<AppBloc>().profileEditFormBloc.submit,
        child: Text(
           I18n.of(context).profileEditScreenUpdate,
          style: TextStyle(color: Colors.white, letterSpacing: 4),
        ),
      ),
    );
  }
}
