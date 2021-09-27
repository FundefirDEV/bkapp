import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AccordionDetailProfitWidget extends StatefulWidget {
  const AccordionDetailProfitWidget(
      {Key key,
      @required this.profitDetail,
      @required this.onSelectedProfitPayment,
      @required this.showSelectCheckBox
    })
      : super(key: key);
  final ProfitPartnerDetailModel profitDetail;
  final Function onSelectedProfitPayment;
  final bool showSelectCheckBox;

  @override
  _AccordionDetailProfitState createState() => _AccordionDetailProfitState();
}

class _AccordionDetailProfitState extends State<AccordionDetailProfitWidget> {
  DetailProfitPayment detailProfitPayment;

  @override
  void initState() {
    super.initState();
    setState(() {
      detailProfitPayment = DetailProfitPayment(
        month: widget.profitDetail.month,
        earningsMonth: widget.profitDetail.earningsMonth,
        detail: widget.profitDetail.detail
          .map((detail) => EnarningsPerYear(
              earning: detail.getEarning, 
              year: detail.year, 
              pay: detail.isPaid ,
              month: detail.month, 
              earningShareIds: detail.earningShareIds,
              earningWihtOutFotmat: detail.earning
          )
          ).toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Accordion(
        headerBackgroundColor: Colors.white,
        title: _titleAccordion(context),
        children: [
          //if(detailProfitPayment.detail.length > 1)
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: detailProfitPayment.detail.length,
              itemBuilder: (BuildContext context, int index) {
                EnarningsPerYear detail = detailProfitPayment.detail[index];
                return _boxEarningsPerYear(detail, context, index);
            }
          )
        ],
      ),
    );
  }

  Container _boxEarningsPerYear(
      EnarningsPerYear detail, BuildContext context, int index) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(detail.year,
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                  color: Theme.of(context).colorScheme.grayColor,
                  fontWeight: FontWeight.bold)
                ),
            ),
            Container(
              child: Row(children: [
                Text(detail.earning),
                  widget.showSelectCheckBox ? 
                  Checkbox(
                    value: detail.pay,
                    onChanged: !widget.profitDetail.detail[index].isPaid
                        ? (bool value) {
                            setState(() => detail.pay = value);
                            widget.onSelectedProfitPayment(detail);
                          }
                    : null)
                : Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: widget.profitDetail.detail[index].isPaid ?
                    Icon(Icons.done , color: Colors.green,) :
                    null
                ), 
              ]
            )
          )
        ],
      )
    );
  }

  Container _titleAccordion(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(widget.profitDetail.month,
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                  color: Theme.of(context).colorScheme.grayColor,
                  fontWeight: FontWeight.bold)),
          Text(widget.profitDetail.getEarningsMonth ??
              I18n.of(context).profitPaymentPaid)
        ]));
  }
}

class DetailProfitPayment {
  DetailProfitPayment({this.month, this.earningsMonth, this.detail});
  String month;
  String earningsMonth;
  List<EnarningsPerYear> detail;
}

class EnarningsPerYear {
  EnarningsPerYear({this.year, 
    this.earning, 
    this.pay ,
    @required this.earningShareIds,
    @required this.month,
    @required this.earningWihtOutFotmat
  });
  String year;
  String earning;
  List<int> earningShareIds;
  bool pay;
  String month;
  double earningWihtOutFotmat;
}
