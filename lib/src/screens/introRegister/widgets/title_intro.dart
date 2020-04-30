import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class TitleIntro extends StatelessWidget {
  const TitleIntro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: I18n.of(context).introScreenYouKnow,
              style: TextStyle(color: Colors.black, fontSize: SizeConfig.blockSizeHorizontal * 5),
              children: <TextSpan>[
                TextSpan(text: I18n.of(context).introScreenGrupoBk, style: TextStyle(fontWeight: FontWeight.w700))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              I18n.of(context).introScreenSelectOption,
            ),
          )
        ],
      ),
    );
  }
}
