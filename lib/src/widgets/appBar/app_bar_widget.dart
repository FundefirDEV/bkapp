import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/loginFormBloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget(
      {Key key, this.container, this.userName, this.enableScrolling: true})
      : super(key: key);

  final Widget container;
  final String userName;
  final bool enableScrolling;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
        type: MaterialType.transparency,
        child: Container(
            color: Theme.of(context).colorScheme.grayColor[50],
            child: Stack(children: <Widget>[
              new Positioned(
                  top: 0,
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 100,
                    height: SizeConfig.blockSizeVertical * 45,
                    child: SvgPicture.asset('assets/images/oval_top.svg',
                        fit: BoxFit.cover),
                  )),
              SafeArea(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 6),
                      child: Column(children: <Widget>[
                        _header(context),
                        Expanded(
                            child: SingleChildScrollView(
                                physics: enableScrolling
                                    ? AlwaysScrollableScrollPhysics()
                                    : NeverScrollableScrollPhysics(),
                                child: this.container))
                      ])))
            ])));
  }

  Container _header(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2.5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                key: Key('icon-salito'),
                child: SvgPicture.asset('assets/images/salo_bot.svg',
                    fit: BoxFit.cover)),
            Container(
                key: Key('text-name'),
                child: Text(this.userName ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        fontWeight: FontWeight.w100))),
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () =>
                    context.read<AppBloc>().authenticationBloc.add(LoggedOut()),
                child: Container(
                    key: Key('button-logout'),
                    child: SvgPicture.asset('assets/images/icon_exit.svg',
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ));
  }
}
