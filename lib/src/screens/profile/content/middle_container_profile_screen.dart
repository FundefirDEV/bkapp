import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/src/screens/profile/content/identification_container.dart';
import 'package:bkapp_flutter/src/screens/profile/content/scholarshipContainer.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class MiddleContainerProfileScreen {
  IdentificationContainer identificationContainer = IdentificationContainer();
  Row middleContainers(context, ProfileModel data) {
    return Row(
      key: Key('Row_middle_containers_profile_screen'),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          key: Key('Id_container_profile_screen'),
          height: 130.0,
          width: SizeConfig.blockSizeHorizontal * 40,
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 4,
            left: SizeConfig.blockSizeHorizontal * 8,
            right: SizeConfig.blockSizeHorizontal * 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.grayColor.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.blockSizeVertical * 2),
              Container(
                key: Key('Middle_container_profile_image'),
                child: SvgPicture.asset('assets/images/user_icon_profile.svg'),
                alignment: Alignment(-0.8, -1.0),
              ),
              identificationContainer.identificationContainer(context, data),
              identificationContainer.birthDateContainer(context, data),
            ],
          ),
        ),
        ScholarshipContainer(data: data),
      ],
    );
  }
}
