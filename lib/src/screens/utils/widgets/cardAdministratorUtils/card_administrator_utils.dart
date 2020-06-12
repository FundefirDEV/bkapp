import 'package:bkapp_flutter/src/screens/utils/utis_card_administrator_item.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardAdministratorUtils extends StatelessWidget {
  const CardAdministratorUtils({Key key, this.adminCharacters})
      : super(key: key);

  final UtilsCardsAdministratorItem adminCharacters;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('container-card-administrator-${adminCharacters.key}'),
      width: SizeConfig.blockSizeHorizontal * 41,
      height: SizeConfig.blockSizeVertical * 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
            )
          ]),
      margin: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical * 1.5,
          horizontal: SizeConfig.safeBlockHorizontal * 2),
      child: Row(
        key: Key('row-content-card-administrator-${adminCharacters.key}'),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              key: Key(
                  'container-image-card-administrator-${adminCharacters.key}'),
              width: SizeConfig.blockSizeHorizontal * 11,
              child: SvgPicture.asset(
                adminCharacters.image,
                key: Key('image-card-administrator-${adminCharacters.key}'),
              )),
          Container(
              key: Key(
                  'text-card-container-administrator-${adminCharacters.key}'),
              width: SizeConfig.blockSizeHorizontal * 30,
              child: adminCharacters.title == ''
                  ? Text(
                      adminCharacters.titleWeight,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5),
                    )
                  : titleText(context))
        ],
      ),
    );
  }

  RichText titleText(BuildContext context) {
    return RichText(
      key: Key('title-text-card-administrator-${adminCharacters.key}'),
      text: TextSpan(
          style: TextStyle(color: Theme.of(context).colorScheme.grayColor),
          children: <TextSpan>[
            TextSpan(
              text: adminCharacters.title + '\n',
              style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3.3),
            ),
            TextSpan(
                text: adminCharacters.titleWeight,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 3.3,
                    fontWeight: FontWeight.w700)),
          ]),
    );
  }
}
