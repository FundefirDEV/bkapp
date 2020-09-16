import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class TotalInterestExemptions extends StatelessWidget {
  const TotalInterestExemptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          I18n.of(context).exemptionsTotalInterest,
          style: TextStyle(color: Theme.of(context).colorScheme.grayColor[300]),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 70,
          width: SizeConfig.blockSizeHorizontal * 75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x11000000),
                  offset: Offset(0, 2),
                  blurRadius: 12,
                  spreadRadius: 0)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 3.6,
                      height: 1.5),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            I18n.of(context).exemptionsOrdinaryInterests + '\n',
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.grayColor[200])),
                    TextSpan(
                        text: r'$400.000',
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.grayColor[200])),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 3.6,
                      height: 1.5),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            I18n.of(context).exemptionsDefaultInterest + ' \n',
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.grayColor[200])),
                    TextSpan(
                        text: r'$400.000',
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.grayColor[200])),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
