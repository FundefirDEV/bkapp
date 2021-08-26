import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class PartnersDetail extends StatelessWidget {
  const PartnersDetail({Key key, 
    @required this.titleDetail,
    @required this.titleDetail2,
    @required this.partnersInfo,
    @required this.padingMiddle,
    })
      : super(key: key);

  final double padingMiddle;
  final String titleDetail;
  final String titleDetail2;
  final List<Map<String , String>> partnersInfo;


  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return Container(
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.only(bottom: 50.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SizeConfig.blockSizeHorizontal * 30,
                padding: EdgeInsets.only(bottom: 25 , 
                  //left: 25
                ),
                child: 
                  Text(I18n.of(context).reportsScreenPartner, textAlign: TextAlign.center,
                  style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3.3 , 
                  fontWeight: FontWeight.w700) ),
              ),
              Container(
                width: SizeConfig.blockSizeHorizontal * 25,
                padding: EdgeInsets.only(bottom: 25 , 
                //left: 60
                ),
                child: Text(titleDetail2,
                textAlign: TextAlign.center,
                  style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3.3 , 
                  fontWeight: FontWeight.w700,
                )),
              ),
              Container(
                width: SizeConfig.blockSizeHorizontal * 25,
                padding: EdgeInsets.only(bottom: 25 , 
                //right: 5
                ),
                child: Text(titleDetail,textAlign: TextAlign.center,
                  style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3.3 , 
                  fontWeight: FontWeight.w700)
                ),
              ),
            ],
          ),
          for (var partner in partnersInfo) ...[
            PartnerCard(
              gender: partner['gender'],
              partnerName: partner['name'],
              titleDetail: titleDetail,
              titleDetail2: titleDetail2,
              detailValue1: partner['detailValue1'],
              detailValue2: partner['detailValue2'],
              padingMiddle: padingMiddle,
            ),
          ]
        ],
      ),
    );
  }
}
