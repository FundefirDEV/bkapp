import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/exemptions/widgets/content_exemptions_pay.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel_widget.dart';
import 'package:flutter/material.dart';

class TotalPayExemptions extends StatelessWidget {
  const TotalPayExemptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Text(I18n.of(context).exemptionsPendingPayment,
              style: (TextStyle(
                  color: Theme.of(context).colorScheme.grayColor[300]))),
        ),
        Carousel(
          heigthContainer: 200,
          viewportFraction: 0.9,
          currentPage: 0,
          children: <Widget>[
            for (var i = 0; i < 2; i++)
              Container(
                  width: SizeConfig.blockSizeHorizontal * 75,
                  margin: EdgeInsets.only(right: 8, left: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x11000000),
                          offset: Offset(0, 2),
                          blurRadius: 12,
                          spreadRadius: 0)
                    ],
                  ),
                  child: ContentExemptionsPay())
          ],
        )
      ],
    );
  }
}
