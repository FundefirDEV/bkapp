import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/footerNameBkWidget/footer_name_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/select_name_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/title_name_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/bg_bank_register.dart';
import 'package:flutter/material.dart';
class NameBkScreen extends StatefulWidget {

  NameBkScreen({Key key}) : super(key: key);

  @override
  _NameBkScreenState createState() => _NameBkScreenState();
}

class _NameBkScreenState extends State<NameBkScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('container-name-bk-screen'),
       child: BgBankRegister(
        child: Column(
          key: Key('column-name-bk-screen'),
          children: <Widget>[
            TitleNameBkWidget(),
            Expanded(
              flex: 2,
              child: SelectNameBkWidget()
            ),
            FooterNameBkWidget()
          ],
        ),
       ),
    );
  }
}