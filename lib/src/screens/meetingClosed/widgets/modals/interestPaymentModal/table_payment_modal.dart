import 'package:bkapp_flutter/core/models/meeting_detail_model.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';

class TablePaymentModal extends StatelessWidget {
  const TablePaymentModal({Key key, this.listPartnertsPayments})
      : super(key: key);
  final List<PartnertsPayments> listPartnertsPayments;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.grayColor[200],
          width: 0.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Table(
        children: [
          TableRow(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.grayColor[200],
                  width: 1,
                ),
              )),
              children: [
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                      child: Text(
                    I18n.of(context).meetingClosedName,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryColor[100]),
                  )),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                      child: Text(I18n.of(context).meetingClosedQuantity,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryColor[100]))),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                      child: Text(I18n.of(context).meetingClosedInterest,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryColor[100]))),
                )),
              ]),
          for (var item in listPartnertsPayments)
            if( double.parse(UtilsTools.removeMoneyFormatter(item.interest)) != 0.0 )
              TableRow(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.grayColor[200],
                    width: 1,
                  ),
                )),
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                          child: Text(
                        item.name,
                        style: TextStyle(fontSize: 11),
                      )),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                          child: Text(
                        item.interest,
                        style: TextStyle(fontSize: 11),
                      )),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                          child: Text(
                        item.creditType,
                        style: TextStyle(fontSize: 11),
                      )
                    ),
                  ),
                ),
              ]
            ),
        ],
      ),
    );
  }
}
