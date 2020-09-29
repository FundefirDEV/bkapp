import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class CreditAwardedDetail extends StatelessWidget {
  CreditAwardedDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: SizeConfig.blockSizeHorizontal * 75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(I18n.of(context).meetingClosedBox,
                    style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600)),
                Text(r'$4.500.000',
                    style: TextStyle(
                        fontSize: 14,
                        height: 2,
                        color: Theme.of(context).colorScheme.grayColor[300])),
              ],
            ),
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal * 75,
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  height: 5,
                  width: SizeConfig.blockSizeHorizontal * 50,
                  color: Colors.blue,
                ),
                Container(
                    height: 5,
                    width: SizeConfig.blockSizeHorizontal * 25,
                    color: Colors.red),
              ],
            ),
          ),
          Container(
              width: SizeConfig.blockSizeHorizontal * 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(I18n.of(context).meetingClosedBorrowed,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          letterSpacing: 2,
                          height: 3),
                      textAlign: TextAlign.end),
                  Text(r'$1.500.000',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.grayColor[300])),
                ],
              )),
        ],
      ),
    );
  }
}
