import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class TitleNameBkWidget extends StatelessWidget {
  const TitleNameBkWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('title-name-bk'),
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 10),
      child: Column(
        children: <Widget>[
          Text(
            I18n.of(context).bankNameByLast,
            key: Key('text1-name-bk'),
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.blockSizeHorizontal * 5.5
            )
          ),
          Text(
            I18n.of(context).bankNamePutName,
            key: Key('text2-name-bk'),
            style: TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.blockSizeHorizontal * 5.5
            )
          )
        ],
      ),
    );
  }
}
