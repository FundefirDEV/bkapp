import 'package:bkapp_flutter/src/screens/profile/widgets/header_profile_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarProfileWidget extends StatelessWidget {
  const AppBarProfileWidget({Key key, @required this.profile, this.container})
      : super(key: key);
  final ProfileModel profile;
  final Widget container;

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
                      key: Key('Top_container_profile_Screen'),
                      width: SizeConfig.safeBlockHorizontal * 100,
                      height: 280,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context)
                                  .colorScheme
                                  .primaryColorDark[50],
                              Theme.of(context).colorScheme.primaryColor[100]
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )))),
              SafeArea(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 6),
                      child: Column(children: <Widget>[
                        _header(context),
                        TitleHeaderWidget(
                            title: I18n.of(context).profileScreenProfile,
                            showArrow: false),
                        HeaderProfileWidget(profile: profile),
                        _editProfile(context),
                        Expanded(
                            child: SingleChildScrollView(child: this.container))
                      ])))
            ])));
  }

  Container _header(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2.5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                key: Key('icon-salito'),
                child: SvgPicture.asset('assets/images/salo_bot.svg',
                    fit: BoxFit.cover)),
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () =>
                    context.bloc<AppBloc>().authenticationBloc.add(LoggedOut()),
                child: Container(
                    key: Key('button-logout'),
                    child: SvgPicture.asset('assets/images/icon_exit.svg',
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ));
  }

  Container _editProfile(BuildContext context) {
    return Container(
        height: SizeConfig.safeBlockVertical * 4,
        margin: EdgeInsets.only(bottom: 40),
        child: FlatButton(
            key: Key('Edit_button_profile_screen'),
            onPressed: () {},
            child: Text(
              I18n.of(context).profileScreenEdit,
              style: TextStyle(color: Colors.white, letterSpacing: 2),
            )));
  }
}