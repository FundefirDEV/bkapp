import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Map<String, String> imageGender = {
  "m": "assets/images/man_square.svg",
  "f": "assets/images/woman_square.svg",
  "o": "assets/images/other_square.svg"
};

class PartnerCard extends StatelessWidget {
  const PartnerCard(
      {Key key,
      @required this.gender,
      @required this.partnerName,
      @required this.titleDetail,
      @required this.detailValue1,
      @required this.detailValue2})
      : super(key: key);

  final String gender;
  final String partnerName;
  final String titleDetail;
  final String detailValue1;
  final String detailValue2;

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
                    Text(I18n.of(context).reportsScreenPartner,
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Text(partnerName)
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(titleDetail, style: TextStyle(fontWeight: FontWeight.w700)),
              Text(detailValue1),
              Text(detailValue2)
            ],
          )
        ],
      ),
    );
  }
}
