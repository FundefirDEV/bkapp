import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NumberPetitions extends StatelessWidget {
  const NumberPetitions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 3),
      child: Column(
        key: Key('Column-petitions'),
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeHorizontal * 5),
              child: SvgPicture.asset(
                'assets/images/approved_icon.svg',
                key: Key('Approved-petitions-image'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeHorizontal * 4),
              child: Text(
                '10',
                key: Key('Number-petitions-value-text'),
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 6,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: RichText(
              key: Key('petitions-text'),
              text: TextSpan(
                style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.blockSizeHorizontal * 3.2),
                text: I18n.of(context).approvalsScreenPetitions,
              ),
            ),
          )
        ],
      ),
    );
  }
}
