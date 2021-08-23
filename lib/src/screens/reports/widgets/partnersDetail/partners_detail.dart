import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class PartnersDetail extends StatelessWidget {
  const PartnersDetail({Key key, 
    @required this.titleDetail,
    @required this.partnersInfo,
    })
      : super(key: key);

  final String titleDetail;
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
              detailValue1: partner['detailValue1'],
              detailValue2: partner['detailValue2'],
            ),
          ]
        ],
      ),
    );
  }
}
