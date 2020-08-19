import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfitPaymentScreen extends StatefulWidget {
  ProfitPaymentScreen({Key key, @required this.userName}) : super(key: key);
  final String userName;
  @override
  _ProfitPaymentScreenState createState() => _ProfitPaymentScreenState();
}

class _ProfitPaymentScreenState extends State<ProfitPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      userName: widget.userName,
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
