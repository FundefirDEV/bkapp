import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/textGreeting/text_greeting_widget.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HeaderContent extends StatelessWidget {
  final double width;
  final double paddingTop;
  final String firstText;
  final FontWeight firstFontWeight;
  final String secondText;
  final FontWeight secondFontWeight;
  final String subtitle;
  final double subtitleWith;
  final bool removePaddingTop;

  const HeaderContent(
      {Key key,
      @required this.width,
      this.paddingTop = 85,
      @required this.firstText,
      this.firstFontWeight,
      this.secondText,
      this.secondFontWeight,
      this.subtitle,
      this.subtitleWith,
      this.removePaddingTop = false
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      padding: EdgeInsets.only(top: removePaddingTop ? 0 : this.paddingTop),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          if (removePaddingTop) ButtonBackWidget(),
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
