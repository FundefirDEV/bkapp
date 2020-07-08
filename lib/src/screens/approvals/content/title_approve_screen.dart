import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleApprovalsWidget extends StatelessWidget {
  const TitleApprovalsWidget({
    Key key,
    @required this.navigateBloc,
    @required this.oldIndex
  }) : super(key: key);

  final MenuNavigatorBloc navigateBloc;
  final int oldIndex;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('Container-title-approvals-screen'),
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 5),
      child: Row(
        key: Key('Row-title-approvals'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () => navigateBloc.add(ButtonPressed(goTo: oldIndex)),
              child: Container(
                key: Key('Left-arrow-title-approvals-screen'),
                alignment: Alignment.centerLeft,
                width: SizeConfig.blockSizeHorizontal * 30,
                child: SvgPicture.asset(
                  'assets/images/left_arrow.svg',
                  key: Key('image-left-arrow-title-apporvals_screen'),
                  color: Colors.white,
                  width: SizeConfig.blockSizeHorizontal * 5,
                ),
              ),
            ),
          ),
          Container(
            key: Key('Title-approvals-container-text'),
            width: SizeConfig.blockSizeHorizontal * 55,
            child: Text(I18n.of(context).approvalsScreenApproval,
              key: Key('Title-approvals-text'),
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 7,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
