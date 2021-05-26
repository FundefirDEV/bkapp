import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/editProfile/widgets/textFields/email_fields.dart';
import 'package:bkapp_flutter/src/screens/editProfile/widgets/textFields/gender_field.dart';
import 'package:bkapp_flutter/src/screens/editProfile/widgets/textFields/name_fields.dart';
import 'package:bkapp_flutter/src/screens/editProfile/widgets/top_container_edit_profile_screen.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';


class ProfileEditScreen extends StatefulWidget {

  final ProfileModel profile;

  ProfileEditScreen({Key key , @required this.profile}) : super(key: key);

  @override
  _ProfileEditScreen createState() => _ProfileEditScreen(key: key , profile: profile);
}

class _ProfileEditScreen extends State<ProfileEditScreen> {

  final ProfileModel profile;
  _ProfileEditScreen({Key key , @required this.profile});
  
  @override
  Widget build(BuildContext context) {

   SizeConfig().init(context);

    return  Scaffold(
      body: SafeArea(
        child: Column(
        key: Key('main_column_rules_edit_screen'),
        children: <Widget>[
          Container(
            height: SizeConfig.screenHeight * .30,
            color: Colors.grey[100],
            child: TopContainerEditProfileScreen(profile: profile),
          ),
          Flexible(
            child: Container(
              key: Key('container_textFields_rules_edit_screen'),
              height: SizeConfig.screenHeight * .70,
              color: Colors.grey[100],
              child: Container(
                child: SingleChildScrollView(
                  key: Key('scrollView_rules_edit_screen'),
                  child: Column(
                    key: Key('column_textFields_rules_edit_screen'),
                    children: <Widget>[
                      Row(
                        key: Key('row_textFields_rules_edit_screen'),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          EmailAndPhoneFields(), 
                          NamesFields(),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 3),
                          child: Row(
                            key: Key('row_middle_textFields_rules_edit_screen'),
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GenderFields(), 
                            ],
                          )),
                      SizedBox(height: SizeConfig.blockSizeVertical * 6),
                      UpdateButton(),
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
      key: Key('container_update_button_rules_edit_screen'),
      height: SizeConfig.blockSizeVertical * 5,
      width: SizeConfig.blockSizeHorizontal * 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Theme.of(context).colorScheme.primaryColor),
      child: FlatButton(
        key: Key('flatButton_rules_edit_screen'),
        onPressed: context.read<AppBloc>().profileEditFormBloc.submit,
        child: Text(
          I18n.of(context).profileEditScreenUpdate,
          style: TextStyle(color: Colors.white, letterSpacing: 4),
        ),
      ),
    );
  }
}
