import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class CreditsRulesContainer extends StatelessWidget {
  const CreditsRulesContainer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('container-credits-rules'),
      margin: EdgeInsets.only(top: 10),
      child: RichText(
          text: TextSpan(
              text: I18n.of(context).rulesScreenMaxValue + '\n', // fijo
              style: TextStyle(
                  color: Theme.of(context).colorScheme.grayColor[300],
                  fontSize: 12),
              children: <TextSpan>[
            TextSpan(
                text: '1.000.000', // variable
                style: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor[200],
                    fontSize: 12))
          ])),
      alignment: Alignment(-0.7, -1.0),
    );
  }

  Container duesContainer(context) {
    return Container(
      key: Key('container_dues_rules'),
      margin: EdgeInsets.only(top: 10),
      child: RichText(
          text: TextSpan(
              text: I18n.of(context).rulesScreenMaxDues + '\n', //fijo
              style: TextStyle(
                  color: Theme.of(context).colorScheme.grayColor[300],
                  fontSize: 12),
              children: <TextSpan>[
            TextSpan(
                text: '3', // variable
                style: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor[200],
                    fontSize: 12))
          ])),
      alignment: Alignment(-0.6, -1.0),
    );
  }
}
