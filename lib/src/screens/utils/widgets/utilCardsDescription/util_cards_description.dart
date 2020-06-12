import 'package:bkapp_flutter/src/screens/utils/utils_cards_item.dart';
import 'package:bkapp_flutter/src/screens/utils/widgets/utilCardsDescription/widgets/text_util_content_card.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UtilCardDescription extends StatelessWidget {
  UtilCardDescription({Key key, this.characters}) : super(key: key);

  final UtilsCardsItem characters;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        key: Key('util-card-description-container-${characters.key}'),
        padding: EdgeInsets.all(0),
        width: SizeConfig.blockSizeHorizontal * 85,
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
        margin:
            EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1.5),
        child: Row(
          key: Key('util-card-description-row-${characters.key}'),
          children: <Widget>[
            Container(
                key: Key('util-card-description-image-${characters.key}'),
                width: SizeConfig.blockSizeHorizontal * 15,
                child: SvgPicture.asset(characters.image)),
            Container(
                key:
                    Key('util-card-description-content-card-${characters.key}'),
                width: SizeConfig.safeBlockHorizontal * 70,
                child: TextUtilContentCard(characters: characters))
          ],
        ));
  }
}
