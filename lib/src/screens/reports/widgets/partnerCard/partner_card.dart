import 'package:bkapp_flutter/core/models/reports_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Map<String, String> imageGender = {
  "m": "assets/images/man_square.svg",
  "f": "assets/images/woman_square.svg",
  "o": "assets/images/other_square.svg"
};

class PartnerCard extends StatelessWidget {
  const PartnerCard({ 
    Key key,
    @required this.gender,
    @required this.partnerName,
    @required this.titleDetail,
    @required this.titleDetail2,
    @required this.detailValue1,
    @required this.detailValue2,
    @required this.padingMiddle
  })
      : super(key: key);

  final String gender;
  final String partnerName;
  final String titleDetail;
  final String titleDetail2;
  final String detailValue1;
  final String detailValue2;
  final double padingMiddle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(imageGender[gender.toLowerCase()]),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(I18n.of(context).reportsScreenPartner,
                    //   style: TextStyle(fontWeight: FontWeight.w700)),
                    Container(
                      width: 50.0,
                      child: Text(partnerName , overflow: TextOverflow.clip,)
                    )
                  ],
                ),
              ),
              if(titleDetail2 != '')
                Padding(
                  padding: EdgeInsets.only(left: 30.0 + padingMiddle),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(titleDetail2,
                      //     style: TextStyle(fontWeight: FontWeight.w700)),
                      Text(detailValue2 ,
                      overflow: TextOverflow.clip, 
                      style: TextStyle(fontSize: 12.0)
                    )
                  ],
                ),
              ),
            ],
          ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Text(titleDetail, style: TextStyle(fontWeight: FontWeight.w700)),
                Text(ReportsModel.formatNumber(detailValue1),
                style: TextStyle(fontSize: 13.0)
              )
            ],
          )
        ],
      ),
    );
  }
}
