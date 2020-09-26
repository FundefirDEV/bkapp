import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/loginFormBloc/authentication/authentication_bloc.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class TopContainerProfile extends StatelessWidget {
  const TopContainerProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('Top_container_profile_Screen'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: InkWell(
                key: Key('Salo_button_container_profile_Screen'),
                onTap: () => {},
                child: SvgPicture.asset('assets/images/salo_bot.svg')),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 61,
          ),
          InkWell(
              key: Key('Exit_button_container_profile_Screen'),
              onTap: () =>
                  context.bloc<AppBloc>().authenticationBloc.add(LoggedOut()),
              child: SvgPicture.asset('assets/images/icon_exit.svg')),
        ],
      ),
    );
  }
}
