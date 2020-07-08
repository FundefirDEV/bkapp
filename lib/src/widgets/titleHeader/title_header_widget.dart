import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_svg/svg.dart';

class TitleHeaderWidget extends StatelessWidget {
  TitleHeaderWidget({
    Key key,
    this.title,
    this.oldIndex,
    this.navigateBloc
  }) : super(key: key);

  final String title;
  final oldIndex;
  final MenuNavigatorBloc navigateBloc;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      key: Key('title-container'),
      margin:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1.5),
      child: Row(
        key: Key('row-title-container'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {
                oldIndex != null
                  ? navigateBloc.add(ButtonPressed(goTo: oldIndex))
                  : Navigator.pop(context);
              },
              child: Container(
                key: Key('left-arrow-image-container-title'),
                alignment: Alignment.centerLeft,
                width: SizeConfig.blockSizeHorizontal * 20,
                child: SvgPicture.asset(
                  'assets/images/left_arrow.svg',
                  key: Key('image-left-arrow-title'),
                  color: Colors.white,
                  width: SizeConfig.blockSizeHorizontal * 5,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              key: Key('title-container-text'),
              child: Text(
                this.title,
                key: Key('title-text'),
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 7,
                    color: Colors.white),
              ),
            ),
          ),
          Container(
            key: Key('right-arrow-image-container-title'),
            width: SizeConfig.blockSizeHorizontal * 20,
          ),
        ],
      ),
    );
  }
}
