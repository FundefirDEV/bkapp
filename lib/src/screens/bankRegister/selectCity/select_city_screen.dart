import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/widgets/footer_select_city_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/widgets/select_city_state_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/widgets/header_select_city_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/bg_bank_register.dart';
import 'package:flutter/material.dart';

class SelectCityScreen extends StatefulWidget {
  SelectCityScreen({Key key}) : super(key: key);

  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCityScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: BgBankRegister(
         child: Column(
           children: <Widget>[
            Container(
              child: HeaderSelectCityWidget()
            ),
            Expanded(
              flex: 2,
              child: SelectCityStateWidget(),
            ),
            Container(
              child: FooterSelectCityWidget()
            )
          ],
         ),
       ),
    );
  }
}
