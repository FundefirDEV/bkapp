import 'package:bkapp_flutter/core/bloc/administratorAsignmentBloc/administrator_asignment_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/utils_tools.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/errorPage/error_page.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:flutter/material.dart';

import 'widgets/switchAdmin/switch_admin_widget.dart';

class AdministratorAssignmentScreen extends StatefulWidget {
  AdministratorAssignmentScreen(
      {Key key, @required this.userName, this.tokenUser})
      : super(key: key);
  final String userName;
  final String tokenUser;
  @override
  _AdministratorAssignmentScreenState createState() =>
      _AdministratorAssignmentScreenState();
}

class _AdministratorAssignmentScreenState
    extends State<AdministratorAssignmentScreen> {
  bool state;
  @override
  void initState() {
    context
        .bloc<AdministratorAsignmentBloc>()
        .add(AdministratorAsignmentInitialize(token: widget.tokenUser));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final navigateBloc = context.bloc<MenuNavigatorBloc>();
    return BlocBuilder<AdministratorAsignmentBloc, AdministratorAsignmentState>(
        builder: (context, state) {
      if (state is AdministratorAsignmentLoaded) {
        return AppBarWidget(
            userName: widget.userName,
            container: Column(
              key: Key('column_administrator_assignmen_screen'),
              children: <Widget>[
                TitleHeaderWidget(
                  title: I18n.of(context).administratorAssignmentTitle,
                  navigateBloc: navigateBloc,
                  oldIndex: 1,
                ),
                for (var i = 0; i < state.administratorModel.length; i++)
                  SwitchAdmin(
                      customKey: Key('switch_admin_$i'),
                      partnerName: UtilsTools.titleCase(
                          state.administratorModel[i].name),
                      phone: state.administratorModel[i].phone,
                      isAdmin: state.administratorModel[i].role == "admin"
                          ? true
                          : false,
                      token: widget.tokenUser,
                      bloc: context.bloc<AdministratorAsignmentBloc>())
              ],
            ));
      }
      if (state is AdministratorAsignmentFailure) {
        return ErrorPage();
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
