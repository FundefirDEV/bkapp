import 'package:bkapp_flutter/core/bloc/administratorAsignmentBloc/administrator_asignment_bloc.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/utils/utils_tools.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/errorPage/error_page.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter/material.dart';

import 'widgets/switchAdmin/switch_admin_widget.dart';

class AdministratorAssignmentScreen extends StatefulWidget {
  AdministratorAssignmentScreen(
      {Key key, @required this.userName, this.tokenUser, this.role})
      : super(key: key);
  final String userName;
  final String tokenUser;
  final String role;
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
        .read<AdministratorAsignmentBloc>()
        .add(AdministratorAsignmentInitialize(token: widget.tokenUser));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    oldIndex: HomeRoutesConstant.utilsScreen,
                    menuNavigatorBloc: context.read<MenuNavigatorBloc>()),
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
                      bloc: context.read<AdministratorAsignmentBloc>(),
                      role: widget.role)
              ],
            ));
      }
      if (state is AdministratorAsignmentFailure) {
        return ErrorPage(errorMessage: state.error);
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
