import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/profileEdit/content/profile_edit_text_fields.dart';
import 'package:bkapp_flutter/src/screens/profileEdit/content/update_button_widget.dart';
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
                      UpdateButtonWidget()
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
