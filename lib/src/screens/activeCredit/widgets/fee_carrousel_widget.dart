import 'package:bkapp_flutter/core/models/my_bank_model.dart';
import 'package:bkapp_flutter/src/screens/activeCredit/widgets/fee_next_card_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeeCarrouselWidget extends StatelessWidget {
  FeeCarrouselWidget({Key key, @required this.installments}) : super(key: key);

  final List<ScheduleInstallment> installments;

  @override
  Widget build(BuildContext context) {
    final installmentList = installments ?? new List();

    SizeConfig().init(context);
    return Carousel(
        viewportFraction: 0.6,
        heigthContainer: 180,
        currentPage: installmentList.length >= 1 ? 1 : 0,
        children: installmentList.map((item) {
          DateTime date = item?.datePayment != ''
              ? DateTime.parse(item?.datePayment)
              : DateTime.now();

          return FeeNextCardWidget(
              feeNumber: item.numberInstallment.toString(),
              paymentDate: DateFormat("MMM dd, yyyy").format(date).toString(),
              valueFee: item.totalPayment);
        }).toList());
  }
}
