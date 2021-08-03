import 'package:bkapp_flutter/core/bloc/profileEdition/data_edit_profile.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardsInformationProfile extends StatelessWidget {
  CardsInformationProfile({Key key, this.profile}) : super(key: key);
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _box(
          context,
          Container(
              child: Column(children: [
            _imageInformation('user_icon_profile'),
            _labelsInformation(context, I18n.of(context).profileScreenId,
                profile.documentNumber),
            _labelsInformation(context, I18n.of(context).profileScreenBirthDate,
              profile.birthDate != 'no data' ? 
                DateTime.parse(profile.birthDate).toIso8601String():
                profile.birthDate
            )
          ]))),
      _box(
          context,
          Container(
              child: Column(children: [
            _imageInformation('collage'),
            _labelsInformation(context,
                I18n.of(context).profileScreenScholarship, scholarshipType[profile.scholarship]),
            _labelsInformation(context,
                I18n.of(context).profileScreenProfession, profile.profession),
          ]))),
    ]));
  }

  Container _imageInformation(String img) {
    return Container(
        alignment: Alignment.centerLeft,
        child: SvgPicture.asset('assets/images/$img.svg'));
  }

  Container _labelsInformation(
      BuildContext context, String title, String description) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 10),
        child: RichText(
            text: TextSpan(
                text: '$title:\n', //cedula fijo
                style: TextStyle(
                    fontFamily: 'nunito',
                    color: Theme.of(context).colorScheme.grayColor[300],
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
              TextSpan(
                  text: description, // cedula variable
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor[200],
                      fontWeight: FontWeight.normal))
            ])));
  }

  Widget _box(BuildContext context, Container content) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 43,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(padding: const EdgeInsets.all(10), child: content),
    );
  }
}
