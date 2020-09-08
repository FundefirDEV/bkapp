import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class IdentificationContainer {
  Container identificationContainer(context, ProfileModel data) {
    return Container(
      key: Key('Identification_container_profile_screen'),
      margin: EdgeInsets.only(top: 10),
      child: RichText(
          text: TextSpan(
              text: I18n.of(context).profileScreenId + '\n', //cedula fijo
              style: TextStyle(
                  color: Theme.of(context).colorScheme.grayColor[300],
                  fontSize: 12),
              children: <TextSpan>[
            TextSpan(
                text: data.documentNumber, // cedula variable
                style: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor[200],
                    fontSize: 12))
          ])),
      alignment: Alignment(-0.7, -1.0),
    );
  }

  Container birthDateContainer(context, ProfileModel data) {
    return Container(
      key: Key('BirthDate_container_profile_screen'),
      margin: EdgeInsets.only(top: 10),
      child: RichText(
          text: TextSpan(
              text: I18n.of(context).profileScreenBirthDate +
                  '\n', //fecha nacimiento fijo
              style: TextStyle(
                  color: Theme.of(context).colorScheme.grayColor[300],
                  fontSize: 12),
              children: <TextSpan>[
            TextSpan(
                text: data.birthDate, // fecha nacimiento variable
                style: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor[200],
                    fontSize: 12))
          ])),
      alignment: Alignment(-0.3, -1.0),
    );
  }
}
