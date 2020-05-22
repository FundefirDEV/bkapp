import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'bg_money_widget.dart';
import 'name_bk_form_widget.dart';

class SelectNameBkWidget extends StatelessWidget {
  const SelectNameBkWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(child: BgMoneyWidget()),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            NameBkFormWidget(),
            Container(
            key: Key('container-label-namebk'),
            child: Text(
                I18n.of(context).bankNameNameBk,
                key: Key('text-name-bk'),
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 9,
                  fontSize: 15,
                  fontWeight: FontWeight.w700
                )
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
