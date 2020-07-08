import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleBuyShareWidget extends StatelessWidget {
  const TitleBuyShareWidget({
    Key key,
    @required this.oldIndex,
    @required this.navigateBloc
  }) : super(key: key);

  final int oldIndex;
  final MenuNavigatorBloc navigateBloc;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('title-buy-share-container'),
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 5),
      child: Row(
        key: Key('row-title-buy-share-container'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () => navigateBloc.add(ButtonPressed(goTo: oldIndex)),
              child: Container(
                key: Key('left-arrow-image-container-title-buy-share'),
                alignment: Alignment.centerLeft,
                width: SizeConfig.blockSizeHorizontal * 30,
                child: SvgPicture.asset(
                  'assets/images/left_arrow.svg',
                  key: Key('image-left-arrow-title-buy-share'),
                  color: Colors.white,
                  width: SizeConfig.blockSizeHorizontal * 5,
                ),
              ),
            ),
          ),
          Container(
            key: Key('title-buy-share-container-text'),
            width: SizeConfig.blockSizeHorizontal * 50,
            child: Text(
              I18n.of(context).buySharesActions,
              key: Key('title-buy-share-text'),
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 7,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
