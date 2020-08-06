import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfitPaymentScreen extends StatefulWidget {
  ProfitPaymentScreen({Key key}) : super(key: key);

  @override
  _ProfitPaymentScreenState createState() => _ProfitPaymentScreenState();
}

class _ProfitPaymentScreenState extends State<ProfitPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      container: Column(
        children: <Widget>[
          TitleHeaderWidget(
            title: I18n.of(context).profitPaymentTitle,
            showArrow: false,
          ),
          LineSeparatorWidget(),
        ],
      ),
    );
  }
}
