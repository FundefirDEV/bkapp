import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class TextGreetingWidget extends StatelessWidget {
  final double width;
  final String firstText;
  final FontWeight firstFontWeight;
  final String secondText;
  final FontWeight secondFontWeight;
  final String subtitle;
  final double subtitleWith;

  const TextGreetingWidget({
    Key key,
    @required this.width,
    @required this.firstText,
    this.firstFontWeight,
    this.secondText,
    this.secondFontWeight,
    this.subtitle,
    this.subtitleWith
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: this.width,
      child: Column(
        children: <Widget>[
          _title(context),
          if (this.subtitle != null) ...[
            _subtitle(context)
          ]
        ],
      ),
    );
  }

  Widget _title(context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: this.firstText,
            style: TextStyle(
              color: Theme.of(context).colorScheme.grayColor,
              fontSize: SizeConfig.safeBlockHorizontal * 5.8,
              fontWeight: this.firstFontWeight ?? FontWeight.w200
            ),
          ),
          TextSpan(
            text: this.secondText,
            style: TextStyle(
              color: Theme.of(context).colorScheme.grayColor,
              fontSize: SizeConfig.safeBlockHorizontal * 5.8,
              fontWeight: this.secondFontWeight ?? FontWeight.w700
            ),
          ),
        ]
      ),
    );
  }

  Widget _subtitle(context) {
    return Container(
      width: this.subtitleWith,
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          this.subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.grayColor,
            fontSize: SizeConfig.safeBlockHorizontal * 4.5,
            fontWeight: FontWeight.w100
          )
        ),
      ),
    );
  }
}
