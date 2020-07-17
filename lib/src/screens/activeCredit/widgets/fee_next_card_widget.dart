import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class FeeNextCardWidget extends StatelessWidget {
  const FeeNextCardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0x11000000),
                offset: Offset(0, 2),
                blurRadius: 12,
                spreadRadius: 0)
          ]),
      margin: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 2, horizontal: 5),
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 2,
          horizontal: SizeConfig.safeBlockHorizontal * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin:
                  EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 1.2),
              child: Text(
                r'$',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor[200],
                    fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                    fontWeight: FontWeight.w100),
              )),
          Expanded(
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor[300],
                      fontFamily: 'Nunito',
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                        text:
                            '${I18n.of(context).activeCreditInstallmentsNumber}1\n'),
                    TextSpan(
                        text: r'$11.000 COP',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                            fontWeight: FontWeight.w100)),
                  ]),
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor[300],
                      fontFamily: 'Nunito',
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                        text: '${I18n.of(context).activeCreditDueDate}:\n'),
                    TextSpan(
                        text: '28 / 5 / 2020',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                            fontWeight: FontWeight.w100)),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
