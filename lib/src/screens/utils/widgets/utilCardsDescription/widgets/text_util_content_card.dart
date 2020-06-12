import 'package:bkapp_flutter/src/screens/utils/utils_cards_item.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class TextUtilContentCard extends StatelessWidget {
  const TextUtilContentCard({Key key, this.characters}) : super(key: key);

  final UtilsCardsItem characters;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      key: Key('row-content-card-utils-${characters.key}'),
      children: <Widget>[
        Expanded(
          key: Key('expanded-content-card-utils-${characters.key}'),
          child: Container(
            key: Key('container-text-content-card-utils-${characters.key}'),
            alignment: Alignment.centerRight,
            width: SizeConfig.blockSizeHorizontal * 28,
            child: cardTitleApprovalValidate(context),
          ),
        ),
        Container(
          key: Key(
              'division-container-text-content-card-utils-${characters.key}'),
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 3),
          height: SizeConfig.blockSizeVertical * 4,
          width: SizeConfig.blockSizeHorizontal * 0.3,
          color: Theme.of(context).colorScheme.grayColor[200],
        ),
        Expanded(
          key: Key(
              'expanded-text-description-content-card-utils-${characters.key}'),
          child: Container(
            key: Key(
                'container-text-description-content-card-utils-${characters.key}'),
            child: RichText(
              key: Key('text-description-content-card-utils-${characters.key}'),
              textAlign: TextAlign.start,
              text: TextSpan(
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor[200]),
                  children: <TextSpan>[
                    TextSpan(
                      text: characters.textDescription,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3),
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }

  RichText cardTitleApprovalValidate(BuildContext context) {
    return RichText(
      key: Key('text-content-card-utils-${characters.key}'),
      textAlign: TextAlign.end,
      text: characters.aprobations == true
          ? TextSpan(
              style: TextStyle(color: Theme.of(context).colorScheme.grayColor),
              children: <TextSpan>[
                  TextSpan(
                    text: characters.title + '\n',
                    style:
                        TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
                  ),
                  TextSpan(
                      text: characters.number,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
                          fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: characters.titleWeight,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
                          fontWeight: FontWeight.w100)),
                ])
          : TextSpan(
              style: TextStyle(color: Theme.of(context).colorScheme.grayColor),
              children: <TextSpan>[
                  TextSpan(
                    text: characters.title + '\n',
                    style:
                        TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
                  ),
                  TextSpan(
                      text: characters.titleWeight,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 4,
                          fontWeight: FontWeight.w700)),
                ]),
    );
  }
}
