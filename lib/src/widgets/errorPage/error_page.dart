import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key key, this.errorMessage = ''}) : super(key: key);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/sad_bot.svg'),
          Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(I18n.of(context).errorPage,
                      textAlign: TextAlign.center))),
          Center(
            child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(this.errorMessage, textAlign: TextAlign.center)),
          )
        ],
      ),
    );
  }
}
