import 'package:bkapp_flutter/src/screens/profileRegister/registerName/widgets/register_name_form_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/gender_image.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterNameContainerWidget extends StatelessWidget {
  final String tag;
  final String image;

  const RegisterNameContainerWidget({Key key, this.tag, this.image})
      : super(key: key);
      
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          child: GenderImage(
            width: SizeConfig.safeBlockHorizontal * 20,
            image: SvgPicture.asset(this.image),
            tag: this.tag,
          ),
        ),
        Container(child: RegisterNameFormWidget())
      ]),
    );
  }
}


