import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'widgets/genderButtons/gender_buttons_widget.dart';
import 'widgets/header_content.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: SafeArea(
        child: Container(
          child: Column(
            key: Key('main-column-gender-screen'),
            children: <Widget>[
              HeaderContent(
                width: SizeConfig.safeBlockHorizontal * 80,
                firstText: I18n.of(context).genderScreenTextFirst,
                firstFontWeight: FontWeight.w700,
                secondText: I18n.of(context).genderScreenTextSecond,
                secondFontWeight: FontWeight.w300,
                subtitle: I18n.of(context).genderScreenTextSubtitle,
              ),
              Expanded(
                key: Key('main-expanded-gender-screen'),
                child: GenderButtonsWidget()
              )
            ],
          ),
        ),
      ),
    );
  }
}
