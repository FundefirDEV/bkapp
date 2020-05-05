import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gender_image.dart';
import 'widgets/register_name_form_widget.dart';

class RegisterNameStepWidget extends StatelessWidget {
  final String tag;
  final String image;

  const RegisterNameStepWidget({
    Key key,
    this.tag,
    this.image
  }) : super(key: key);

  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: SizeConfig.safeBlockVertical * 2
          ),
          child: GenderImage(
            width: SizeConfig.safeBlockHorizontal * 50,
            image: SvgPicture.asset(this.image),
            tag: this.tag,
          ),
        ),
        Container(child: RegisterNameFormWidget())
      ]),
    );
  }
}
