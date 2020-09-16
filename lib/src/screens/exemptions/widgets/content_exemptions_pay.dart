import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class ContentExemptionsPay extends StatelessWidget {
  const ContentExemptionsPay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryColor[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Center(
                    child: Text(I18n.of(context).exemptionsShare + ' #1',
                        style: TextStyle(color: Colors.white, fontSize: 12))),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.grayColor[300]),
                    children: <TextSpan>[
                      TextSpan(
                          text: I18n.of(context).exemptionsTotalPay + '\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: r'$230.000'),
                    ],
                  ),
                ),
              )
            ],
          ),
          interestDetail(context),
          Container(
            height: 1,
            width: 40,
            margin: EdgeInsets.only(bottom: 10),
            color: Theme.of(context).colorScheme.grayColor[200],
          ),
          FlatButton(
              color: Theme.of(context).colorScheme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: () {},
              child: Text(
                I18n.of(context).exemptionsExonerate,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 2.8,
                ),
              )),
          ordinaryInterestText(context)
        ],
      ),
    );
  }

  Container interestDetail(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3.3),
              children: <TextSpan>[
                TextSpan(
                    text: I18n.of(context).rulesScreenOrdinaryInterest + '\n',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.grayColor[300])),
                TextSpan(
                    text: r'$400.000',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.grayColor[300])),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3.3),
              children: <TextSpan>[
                TextSpan(
                    text: I18n.of(context).exemptionsDefaultInterest + '\n',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.grayColor[300])),
                TextSpan(
                    text: r'$400.000',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.grayColor[300])),
              ],
            ),
          )
        ],
      ),
    );
  }

  RichText ordinaryInterestText(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 10),
        children: <TextSpan>[
          TextSpan(
              text: I18n.of(context).exemptionsInterests + ' ',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.grayColor[300])),
          TextSpan(
              text: I18n.of(context).exemptionsOrdinary,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.grayColor[300])),
        ],
      ),
    );
  }
}
