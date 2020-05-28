import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PartnerCardWidget extends StatelessWidget {
  const PartnerCardWidget({
    Key key,
    @required this.name,
    @required this.mobile
  }) : super(key: key);

  final String name;
  final String mobile;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Stack(
      key: Key('first-stack-partner-card'),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15.0, right: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                key: Key('second-stack-partner-card'),
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/user_icon_yellow.svg',
                    width: SizeConfig.safeBlockHorizontal * 12,
                  ),
                  Positioned(
                    bottom: 17.0,
                    right: 10.0,
                    child: _dataPartner()
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -5.0,
          right: -9.0,
          child: RawMaterialButton(
            onPressed: () {},
            elevation: 4.0,
            constraints: BoxConstraints(minWidth: 23.0, minHeight: 23.0),
            shape: CircleBorder(),
            fillColor: Colors.white,
            child: Icon(
              Icons.close,
              size: 17.0,
              color: Theme.of(context).colorScheme.errorColor
            ),
          )
        ),
      ],
    );
  }

  Widget _dataPartner() {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            maxLines: 2,
            style: TextStyle(
              height: 1,
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              fontWeight: FontWeight.w300,
              
            ),
          ),
          Text(mobile,
            maxLines: 1,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 3.5,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4
            ),
          )
        ],
      ),
    );
  }
}

