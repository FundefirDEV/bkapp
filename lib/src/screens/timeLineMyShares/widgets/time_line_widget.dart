import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget({Key key, @required this.model}) : super(key: key);
  final Date model;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text(model.date,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor))),
          Container(
              width: 60,
              child: Column(
                  children: [_line(context), _circule(), _line(context)])),
          Expanded(
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          color: Theme.of(context).colorScheme.grayColor),
                      children: [
                TextSpan(text: '${I18n.of(context).timeLineSharesAmount}\n'),
                TextSpan(
                    text: model.shares,
                    style: TextStyle(fontWeight: FontWeight.bold))
              ])))
        ]);
  }

  Padding _circule() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 7.0),
        child: Container(
            width: 13,
            height: 13,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors
                    .red) //Theme.of(context).colorScheme.primaryColor[100]),
            ));
  }

  Container _line(BuildContext context) {
    return Container(
      width: 5,
      height: 45,
      color: Theme.of(context).colorScheme.grayColor[100],
    );
  }
}
