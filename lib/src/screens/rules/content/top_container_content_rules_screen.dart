import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/loginFormBloc/authentication/authentication_bloc.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class TopContainerContentRulesScreen {

  TopContainerContentRulesScreen(
    this.context
  );

  final BuildContext context;
  Container saloAndArrow() {
    return Container(
      key: Key('top_container_content_rules_Screen'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: SizeConfig.blockSizeVertical * 5,
            child: InkWell(
                key: Key('salo_button_container_content_rules_Screen'),
                onTap: () => {},
                child: SvgPicture.asset('assets/images/salo_bot.svg')),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 61,
          ),
          InkWell(
              key: Key('exit_button_container_content_rules_Screen'),
              onTap: () => context.read<AppBloc>().authenticationBloc.add(LoggedOut()),
              child: SvgPicture.asset('assets/images/icon_exit.svg')),
        ],
      ),
    );
  }
}
