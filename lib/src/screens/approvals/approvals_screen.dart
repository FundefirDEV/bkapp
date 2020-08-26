import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/approvals/content/number_petitions.dart';
import 'package:bkapp_flutter/src/screens/approvals/widgets/approvals_content.dart';
import 'package:bkapp_flutter/src/utils/after_layaut.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/widgets/errorPage/error_page.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/material.dart';
import 'content/accepted_discarted_container.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ApprovalsScreen extends StatefulWidget {
  ApprovalsScreen(
      {Key key,
      @required this.oldIndex,
      @required this.userName,
      this.tokenUser,
      this.role})
      : super(key: key);

  final int oldIndex;
  final String userName;
  final String tokenUser;
  final String role;

  @override
  _ApprovalsScreenState createState() => _ApprovalsScreenState();
}

class _ApprovalsScreenState extends State<ApprovalsScreen>
    with AfterLayoutMixin<ApprovalsScreen> {
  @override
  void afterFirstLayout(BuildContext context) {
    context
        .bloc<ApprovalsBloc>()
        .add(ApprovalsInitialize(token: widget.tokenUser));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    MenuNavigatorBloc menuNavigatorBloc = context.bloc<MenuNavigatorBloc>();
    return BlocBuilder<ApprovalsBloc, ApprovalsState>(
      builder: (context, state) {
        if (state is ApprovalsLoaded) {
          return AppBarWidget(
            userName: widget.userName,
            container: Column(
              key: Key('column-appbar-approvals-screen'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TitleHeaderWidget(
                    title: I18n.of(context).approvalsScreenApproval,
                    showArrow: true,
                    oldIndex: widget.oldIndex,
                    navigateBloc: menuNavigatorBloc,
                  ),
                ),
                CardInformationBkWidget(
                    childBlueWidth: 135.0,
                    childBlue: NumberPetitions(data: state.approvals),
                    childWhite: AcceptedDiscarted(data: state.approvals)),
                SizedBox(height: 20.0),
                ApprovalsContent(
                    data: state.approvals,
                    token: widget.tokenUser,
                    role: widget.role),
              ],
            ),
          );
        }
        if (state is ApprovalsFailure) {
          return ErrorPage();
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
