import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class BoxSharesWidget extends StatelessWidget {
  const BoxSharesWidget({Key key, @required this.shares}) : super(key: key);
  final String shares;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        width: SizeConfig.safeBlockHorizontal * 50,
        padding: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color(0x11000000),
                  offset: Offset(0, 2),
                  blurRadius: 12,
                  spreadRadius: 0)
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: TextStyle(
                    fontFamily: 'nunito',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.grayColor),
                children: [
                  TextSpan(text: '${this.shares}\n'),
                  TextSpan(
                      text: I18n.of(context).timeLineSharesTitleBox,
                      style: TextStyle(
                          letterSpacing: 3,
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.grayColor[200])),
                ])));
  }
}
