import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class ScholarshipContainer extends StatelessWidget {
  const ScholarshipContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      key: Key('Scholarship_container_profile_screen'),
      height: 130.0,
      width: SizeConfig.blockSizeHorizontal * 40,
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 4,
        right: SizeConfig.blockSizeHorizontal * 8,
        left: SizeConfig.blockSizeHorizontal * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.grayColor.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: scholarshipColumn(context),
    );
  }
}

Column scholarshipColumn(context) {
  return Column(
    children: <Widget>[
      SizedBox(height: SizeConfig.blockSizeVertical * 2),
      Container(
        key: Key('Collage_image_container_profile_screen'),
        child: SvgPicture.asset('assets/images/collage.svg'),
        alignment: Alignment(-0.8, -1.0),
      ),
      Container(
        key: Key('Scholarship_container_profile_screen'),
        margin: EdgeInsets.only(top: 10),
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                text: I18n.of(context).profileScreenScholarship + '\n',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor[300],
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Profesional',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.grayColor[200],
                          fontSize: 12))
                ])),
        alignment: Alignment(-0.7, -1.0),
      ),
      Container(
        key: Key('Profession_container_profile_screen'),
        margin: EdgeInsets.only(top: 10),
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                text: I18n.of(context).profileScreenProfession + '\n',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor[300],
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Abogado',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.grayColor[200],
                          fontSize: 12))
                ])),
        alignment: Alignment(-0.7, -1.0),
      ),
    ],
  );
}
