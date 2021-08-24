import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class PartnersDetail extends StatelessWidget {
  const PartnersDetail({Key key, 
    @required this.titleDetail,
    @required this.titleDetail2,
    @required this.partnersInfo,
    })
      : super(key: key);

  final String titleDetail;
  final String titleDetail2;
  final List<Map<String , String>> partnersInfo;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Text(I18n.of(context).reportsScreenDetail,
                style: TextStyle(fontSize: 18.0)),
          ),
          for (var partner in partnersInfo) ...[
            PartnerCard(
              gender: partner['gender'],
              partnerName: partner['name'],
              titleDetail: titleDetail,
              titleDetail2: titleDetail2,
              detailValue1: partner['detailValue1'],
              detailValue2: partner['detailValue2'],
            ),
          ]
        ],
      ),
    );
  }
}
