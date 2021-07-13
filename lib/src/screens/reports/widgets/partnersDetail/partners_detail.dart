import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class PartnersDetail extends StatelessWidget {
  const PartnersDetail({Key key, @required this.partners, this.titleDetail})
      : super(key: key);

  final List partners;
  final String titleDetail;

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
          for (var partner in partners) ...[
            PartnerCard(
              gender: partner['gender'],
              partnerName: partner['name'],
              titleDetail: titleDetail,
              detailValue: partner['shareValue'],
            ),
          ]
        ],
      ),
    );
  }
}
