import 'package:bkapp_flutter/core/models/my_bank_model.dart';
import 'package:bkapp_flutter/src/screens/activeCredit/widgets/fee_next_card_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel_widget.dart';
import 'package:flutter/material.dart';

class FeeCarrouselWidget extends StatelessWidget {
  FeeCarrouselWidget({
    Key key,
    @required this.installments
  }) : super(key: key);

  final List<ScheduleInstallment> installments;

  @override
  Widget build(BuildContext context) {
    final installmentList = installments ?? new List();

    SizeConfig().init(context);
    return Carousel(
        viewportFraction: 0.6,
        heigthContainer: 180,
        children: <Widget>[
          for (var i = 0; i < installmentList.length; i++)
            FeeNextCardWidget(
              feeNumber: installmentList[i].numberInstallment.toString(),
              paymentDate: '28 / 05 / 2020',
              valueFee: installmentList[i].totalPayment
            )
        ]);
  }
}
