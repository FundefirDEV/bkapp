import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class TitleImageBottomModalWidget extends StatelessWidget {
  const TitleImageBottomModalWidget(
      {Key key, this.title, this.titleBold, this.isBold})
      : super(key: key);

  final String title;
  final String titleBold;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return RichText(
        key: Key('text_title_image_bottom_modal'),
        textAlign: TextAlign.center,
        text: isBold == true
            ? TextSpan(
                text: title + '\n',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Theme.of(context).colorScheme.grayColor),
                children: <TextSpan>[
                  TextSpan(
                      text: titleBold,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              )
            : TextSpan(text: title, style: DefaultTextStyle.of(context).style));
  }
}
