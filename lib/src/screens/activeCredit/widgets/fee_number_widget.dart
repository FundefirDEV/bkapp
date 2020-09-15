import 'package:bkapp_flutter/core/models/my_bank_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeeNumberWidget extends StatelessWidget {
  FeeNumberWidget({Key key, @required this.installment}) : super(key: key);

  final ScheduleInstallment installment;

  @override
  Widget build(BuildContext context) {
    DateTime date = installment?.datePayment != ''
        ? DateTime.parse(installment?.datePayment)
        : DateTime.now();
    SizeConfig().init(context);

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 4,
          horizontal: SizeConfig.safeBlockHorizontal * 4),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              '${I18n.of(context).activeCreditInstallments} #${installment?.numberInstallment}',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          )),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Expanded(
                  child: Text(I18n.of(context).activeCreditMaximumPaymentDate,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700)),
                ),
                Text(DateFormat("MMM dd, yyyy").format(date).toString(),
                    style: TextStyle(color: Colors.white, fontSize: 14))
              ]))
        ],
      ),
    );
  }
}
