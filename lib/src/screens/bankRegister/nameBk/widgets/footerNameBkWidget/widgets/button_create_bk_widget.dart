import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class ButtonCreateBkWidget extends StatelessWidget {
  const ButtonCreateBkWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Container(
        key: Key('container-flatbutton-footer'),
        margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 4),
        child: FlatButton(
          key: Key('flatbutton-create-bk'),
          child: Padding(
            key: Key('padding-label-button-create'),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              I18n.of(context).bankNameCreate,
              key: Key('text-flatbutton-create'),
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 5.5,
              )
            ),
          ),
          onPressed: () {},
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.solid
            ),
            borderRadius: BorderRadius.circular(30.0)
          ),
        ),
      ),
    );
  }
}
