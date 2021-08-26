import 'package:bkapp_flutter/core/models/reports_model.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
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

    SizeConfig().init(context);

    double partnerContainerExtraSize = detailValue2 == '' ?
      40 : 0;

    return Container(
      padding: EdgeInsets.only(bottom: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width:
              SizeConfig.blockSizeHorizontal * 30 + partnerContainerExtraSize ,
            child: Row(
              children: [
                SvgPicture.asset(
                  imageGender[gender.toLowerCase()] , 
                  width:SizeConfig.blockSizeHorizontal * 10 
                ),
                Container(
                  width: 
                    SizeConfig.blockSizeHorizontal * 18 + partnerContainerExtraSize ,
                  padding: EdgeInsets.only(
                    left:SizeConfig.blockSizeHorizontal* 2
                  ),
                  child: Tooltip(
                    message: partnerName,
                    preferBelow: false,
                    waitDuration: const Duration(milliseconds: 250),
                    child: Text(
                      partnerName , 
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3)
                    ),
                  ),
                ),
              ],
            ),
          ),
            if(titleDetail2 != '')
                Container(
                  width:  SizeConfig.blockSizeHorizontal * 25,
                  child: Text(detailValue2 ,
                    overflow: TextOverflow.clip, 
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3)
                ),
              ),
            Container(
              width:  SizeConfig.blockSizeHorizontal * 25,
              child: Text(
                ReportsModel.formatNumber(detailValue1),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3)
            ),
          )
        ],
      ),
    );
  }
}
