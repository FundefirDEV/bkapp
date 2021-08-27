import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/rules/content/top_container_content_rules_screen.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class TopContainerEditRulesScreen extends StatelessWidget {
  const TopContainerEditRulesScreen({Key key, this.navigateBloc})
      : super(key: key);

  final navigateBloc;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('top_container_rules_edit_Screen'),
      height: SizeConfig.safeBlockVertical * 38,
      width: SizeConfig.safeBlockHorizontal * 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryColorDark[50],
            Theme.of(context).colorScheme.primaryColor[100]
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        key: Key('top_container_column_rules_edit_Screen'),
        children: <Widget>[
          SizedBox(height: SizeConfig.blockSizeVertical * 2.6),
          TopContainerContentRulesScreen(context).saloAndArrow(),
          Container(
            margin: EdgeInsets.only(left: SizeConfig.safeBlockVertical * 3.5),
            child: TitleHeaderWidget(
                title: I18n.of(context).rulesScreenBkRules,
                oldIndex: 8,
                menuNavigatorBloc: context.read<MenuNavigatorBloc>()),
          ),
          topContainerInformation(),
          Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
              height: SizeConfig.safeBlockVertical * 4,
              child: Text(
                I18n.of(context).profileEditScreenEditionMode,
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  Container topContainerInformation() {
    return Container(
      key: Key('top_container_info_rules_edit_Screen'),
      height: SizeConfig.safeBlockVertical * 15.5,
      child: Container(
          height: SizeConfig.blockSizeVertical * 40,
          width: SizeConfig.blockSizeHorizontal * 30,
          child: SvgPicture.asset(
            'assets/images/logo_rules_screen.svg',
          )),
    );
  }
}
