import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class ReunionRulesContainer extends StatelessWidget {
  const ReunionRulesContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      key: Key('container_reunion_rules'),
      height: SizeConfig.blockSizeVertical * 18,
      width: SizeConfig.blockSizeHorizontal * 40,
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 2,
        right: SizeConfig.blockSizeHorizontal * 8,
        left: SizeConfig.blockSizeHorizontal * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.grayColor.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: interestColumn(context),
    );
  }
}

Column interestColumn(context) {
  return Column(
    key: Key('column_reunion_rules'),
    children: <Widget>[
      SizedBox(height: SizeConfig.blockSizeVertical * 2),
      Container(
       key: Key('top_container_reunion_rules'),
        child: Row(children: <Widget>[
          SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
          Icon(Icons.people_outline,
              color: Theme.of(context).colorScheme.grayColor.withOpacity(0.5)),
          SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
          Text(I18n.of(context).rulesScreenReunion,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.grayColor[400],
                  fontSize: 14))
        ]),
        //alignment: Alignment(-0.8, -1.0),
      ),
      Container(
       key: Key('middle_container_reunion_rules'),
        margin: EdgeInsets.only(top: 10),
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                text: I18n.of(context).rulesScreenWeek + '\n',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor[300],
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Primera',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.grayColor[200],
                          fontSize: 12))
                ])),
        alignment: Alignment(-0.8, -1.0),
      ),
      Container(
       key: Key('bottom_container_reunion_rules'),
        margin: EdgeInsets.only(top: 10),
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                text: I18n.of(context).rulesScreenDay + '\n',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor[300],
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Lunes',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.grayColor[200],
                          fontSize: 12))
                ])),
        alignment: Alignment(-0.8, -1.0),
      ),
    ],
  );
}
