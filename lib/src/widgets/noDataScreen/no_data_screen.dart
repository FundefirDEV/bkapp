import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({Key key, this.noDataMessage = ''}) : super(key: key);
  final String noDataMessage;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/group_102.svg'),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(I18n.of(context).noDataScreenNoDataMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            )
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                this.noDataMessage, 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}
