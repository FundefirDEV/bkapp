import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_next_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BankCreatedScreen extends StatelessWidget {

  final String bkName = "superBk";
  const BankCreatedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
          child: Column(
            key: Key('column_bank_created_screen'),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(child : _buildText(context, bkName)),
              Center(
                key: Key('svgPicture_bank_created'),
                child: SvgPicture.asset('assets/images/bank_created.svg')),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:<Widget>[ 
                  ButtonNextWidget(onTap: () => {},),
                  ]
                ),
              )
          ],
        )
      )
    );
  }
  Widget _buildText(context, String bkName){
    SizeConfig().init(context);
    return RichText(
            key: Key('richText_bank_created_screen'),
            textAlign: TextAlign.center,
            text: TextSpan(
                text: I18n.of(context).bankCreatedScreenVery,
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 2.0,
                  color: Colors.grey,
                ),
            children: <TextSpan>[
              TextSpan(
                text: I18n.of(context).bankCreatedScreenGood + '\n',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: bkName,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: I18n.of(context).bankCreatedScreenHasBeenCreaed,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                ),
              )
          ]),
      );
  }
}