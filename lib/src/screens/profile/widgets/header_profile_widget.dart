import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/src/screens/profile/widgets/image_country.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderProfileWidget extends StatelessWidget {
  HeaderProfileWidget({Key key, @required this.profile}) : super(key: key);
  final ProfileModel profile;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        width: SizeConfig.safeBlockHorizontal * 100,
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: SvgPicture.asset('assets/images/woman_profile.svg',
                    fit: BoxFit.contain, key: Key('Profile_picture')),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: UtilsTools.titleCase(profile.firstname) + '\n',
                        style: TextStyle(
                          fontFamily: 'nunito',
                          height: 1.2,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: UtilsTools.titleCase(profile.lastname) + '\n',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: profile.email,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: SvgPicture.asset(
                            imageCountry(profile.country.iso),
                            height: 18.0,
                          ),
                        ),
                        Text(
                          profile.phone,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
