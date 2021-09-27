import 'package:bkapp_flutter/core/models/my_bank_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailCreditWidget extends StatelessWidget {
  DetailCreditWidget({Key key, @required this.activeCredits}) : super(key: key);

  final ActiveCredit activeCredits;

  @override
  Widget build(BuildContext context) {
    DateTime approvalDate = activeCredits?.approvalDate != ''
        ? DateTime.parse(activeCredits?.approvalDate)
        : DateTime.now();
    DateTime dueDate = activeCredits?.dueDate != 'null'
        ? DateTime.parse(activeCredits?.dueDate)
        : DateTime.parse(activeCredits?.scheduleInstallment?.last?.datePayment);

    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 100,
      height: 350,
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical * 5,
        horizontal: SizeConfig.blockSizeHorizontal * 2,
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0x11000000),
            offset: Offset(0, 2),
            blurRadius: 12,
            spreadRadius: 0)
      ]),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: SizeConfig.blockSizeHorizontal * 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Theme.of(context).colorScheme.primaryColor[100]),
              child: Container(
                  alignment: Alignment.center,
                  child: Text(I18n.of(context).activeCreditCreditDetail,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal * 4.8,
                          fontWeight: FontWeight.w200))),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                width: SizeConfig.blockSizeHorizontal * 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.white),
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 3,
                    horizontal: SizeConfig.blockSizeHorizontal * 6),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          Text(I18n.of(context).activeCreditCreditAwarded),
                          Text(activeCredits?.amount ?? r'$0',
                              style: TextStyle(fontWeight: FontWeight.w700))
                        ])),
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          Text(I18n.of(context).activeCreditTotalCredit),
                          Text(activeCredits?.totalCredit ?? r'$0',
                              style: TextStyle(fontWeight: FontWeight.w700))
                        ])),
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          Text(I18n.of(context).activeCreditOrdinaryInterest),
                          Text(activeCredits?.totalInterest ?? r'$0',
                              style: TextStyle(fontWeight: FontWeight.w700))
                        ])),
                    // TODO DISCOMMENT WHEN DETERMINATION INTEREST IS PUTTED INTO USE
                    // Expanded(
                        // child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // children: <Widget>[
                          // Text(I18n.of(context).activeCreditDefaultInterest),
                          // Text(r'$0.000',
                              // style: TextStyle(fontWeight: FontWeight.w700))
                        // ])),
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          Text(I18n.of(context)
                              .activeCreditPaymentInterestsMethod),
                          Text(
                              activeCredits.isAdvanceCredit
                                  ? I18n.of(context).activeCreditAdvance
                                  : I18n.of(context).activeCreditInstallment,
                              style: TextStyle(fontWeight: FontWeight.w700))
                        ])),
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          Text(I18n.of(context).activeCreditApplicationDate),
                          Text(
                              DateFormat("MMM dd, yyyy")
                                  .format(approvalDate)
                                  .toString(),
                              style: TextStyle(fontWeight: FontWeight.w700))
                        ])),
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          Text(I18n.of(context).activeCreditDueDate),
                          Text(
                              DateFormat("MMM dd, yyyy")
                                  .format(dueDate)
                                  .toString(),
                              style: TextStyle(fontWeight: FontWeight.w700))
                        ])),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
