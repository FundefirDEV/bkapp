import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class GainButtonProfileScreen {
  Container gainContainerButton(context) {
    return Container(
      key: Key('Container_gain_button_profile_screen'),
      height: SizeConfig.blockSizeVertical * 10,
      width: SizeConfig.blockSizeHorizontal * 90,
      margin: EdgeInsets.only(top: 20, left: 34, right: 34, bottom: 15),
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
      child: FlatButton(
          key: Key('Flat_button_gain_button_profile_screen'),
          onPressed: () => {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                key: Key('Internal_container_gain_button_profile_screen'),
                child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        text: '\$' + '1.000.000' + '\n',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: I18n.of(context).profileScreenMy + ' ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: I18n.of(context).profileScreenEarnings,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ])),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          )),
    );
  }
}
