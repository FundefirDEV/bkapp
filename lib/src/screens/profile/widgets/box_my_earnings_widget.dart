import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class BoxMyEarningsWidget extends StatelessWidget {
  const BoxMyEarningsWidget({Key key, this.profile}) : super(key: key);
  final ProfileModel profile;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.safeBlockHorizontal * 90,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryColor[100],
              Theme.of(context).colorScheme.primaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            onTap: () {},
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                text: profile.earnings + '\n',
                                style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 21,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        I18n.of(context).profileScreenMy + ' ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        I18n.of(context).profileScreenEarnings,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ])),
                      ),
                      Container(
                          alignment: Alignment.topRight,
                          child: Container(
                            child: SvgPicture.asset('assets/images/path.svg',
                                fit: BoxFit.contain),
                          ))
                    ]))),
      ),
    );
  }
}
