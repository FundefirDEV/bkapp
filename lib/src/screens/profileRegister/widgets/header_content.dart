import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/textGreeting/text_greeting_widget.dart';
import 'package:flutter/material.dart';

class HeaderContent extends StatelessWidget {
  final double width;
  final String firstText;
  final FontWeight firstFontWeight;
  final String secondText;
  final FontWeight secondFontWeight;
  final String subtitle;
  final double subtitleWith;

  const HeaderContent(
      {Key key,
      @required this.width,
      @required this.firstText,
      this.firstFontWeight,
      this.secondText,
      this.secondFontWeight,
      this.subtitle,
      this.subtitleWith})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      padding: EdgeInsets.only(top: 85),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          TextGreetingWidget(
            width: this.width,
            firstText: this.firstText,
            firstFontWeight: this.firstFontWeight,
            secondText: this.secondText,
            secondFontWeight: this.secondFontWeight,
            subtitle: this.subtitle,
            subtitleWith: this.subtitleWith,
          )
        ],
      ),
    );
  }
}
