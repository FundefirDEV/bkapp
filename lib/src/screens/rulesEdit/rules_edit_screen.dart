import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'content/textFields/credit_fields.dart';
import 'content/textFields/fund_fields.dart';
import 'content/textFields/interests_fields.dart';
import 'content/textFields/payment_field.dart';
import 'content/textFields/reunion_fields.dart';
import 'content/textFields/share_field.dart';
import 'content/top_container_edit_rules_screen.dart';

class RulesEditScreen extends StatefulWidget {
  RulesEditScreen({Key key}) : super(key: key);

  @override
  _RulesEditScreenState createState() => _RulesEditScreenState();
}

class _RulesEditScreenState extends State<RulesEditScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final navigateBloc = context.bloc<MenuNavigatorBloc>();

    SizeConfig().init(context);
    return Scaffold(
      key: Key('scaffold_rules_edit_screen'),
      body: SafeArea(
          child: Column(
        key: Key('main_column_rules_edit_screen'),
        children: <Widget>[
          Container(
            color: Colors.grey[300],
            child: Container(
                color: Colors.grey[300],
                child: TopContainerEditRulesScreen(
                  navigateBloc: navigateBloc,
                )),
          ),
          Flexible(
            child: Container(
              key: Key('container_textFields_rules_edit_screen'),
              height: SizeConfig.safeBlockVertical * 65,
              color: Colors.grey[300],
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
                          CreditFields(),
                          InterestsFields(),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 3),
                          child: Row(
                            key: Key('row_middle_textFields_rules_edit_screen'),
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[PaymentField(), ShareField()],
                          )),
                      Row(
                        key: Key('row_bottom_textFields_rules_edit_screen'),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FundFields(),
                          ReunionFields(),
                        ],
                      ),
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
        onPressed: context.bloc<AppBloc>().rulesEditFormBloc.submit,
        child: Text(
          I18n.of(context).profileEditScreenUpdate,
          style: TextStyle(color: Colors.white, letterSpacing: 4),
        ),
      ),
    );
  }
}
