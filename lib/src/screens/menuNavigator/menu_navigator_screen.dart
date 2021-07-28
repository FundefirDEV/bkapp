import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/services/sql/sqflite.dart';
import 'package:bkapp_flutter/src/screens/editProfile/edit_profile_screen.dart';
import 'package:bkapp_flutter/src/screens/exemptions/exemptions_screen.dart';
import 'package:bkapp_flutter/src/screens/timeLineMyCredit/time_line_my_credit_screen.dart';
import 'package:bkapp_flutter/src/screens/timeLineMyShares/time_line_my_shares_screen.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/activeCredit/active_credit_screen.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/meeting_closed_screen.dart';
import 'package:bkapp_flutter/src/screens/rules/rules_screen.dart';
import 'package:bkapp_flutter/src/screens/rulesEdit/rules_edit_screen.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:bkapp_flutter/src/screens/home/home_screen.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'bloc_providers.dart';
import 'widgets/widgets.dart';

class MenuNavigatorScreen extends StatefulWidget {
  MenuNavigatorScreen({Key key, this.tokenUser, this.userName, this.role})
      : super(key: key);
  final String tokenUser;
  final String userName;
  final String role;
  @override
  _MenuNavigatorState createState() => _MenuNavigatorState();
}

class _MenuNavigatorState extends State<MenuNavigatorScreen>
    with SingleTickerProviderStateMixin {
  PageController _myPage = PageController(initialPage: 0);
  AnimationController _animateController;
  Offset position = Offset(20.0, 20.0);
  ActivePartnersDbProvider partnerDb;

  bool hasLoaded = false;
  int currentIndex = 0;

  @override
  void initState() {
    _animateController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 380));

    _animateController.addListener(() => setState(() {}));
    partnerDb = ActivePartnersDbProvider.db;
    super.initState();
  }

  @override
  void dispose() {
    _animateController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            extendBody: true,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            bottomNavigationBar: CustomBottomBar(
              notchedShape: CircularNotchedRectangle(),
              color: Theme.of(context).colorScheme.grayColor[200],
              selectedColor: Theme.of(context).colorScheme.primaryColor,
              onTabSelected: (index) {
                _myPage.jumpToPage(index);
                setState(() => currentIndex = index);
              },
              items: [
                BottomBarItem(
                    key: Key('home-bottom-bar-item'),
                    iconData: 'assets/images/home.svg',
                    text: I18n.of(context).mainMenuBarHome.toUpperCase()),
                BottomBarItem(
                    key: Key('utils-bottom-bar-item'),
                    iconData: 'assets/images/archive.svg',
                    text: I18n.of(context).mainMenuBarUtils.toUpperCase()),
                BottomBarItem(
                    key: Key('profile-bottom-bar-item'),
                    iconData: 'assets/images/user.svg',
                    text: I18n.of(context).mainMenuBarProfile.toUpperCase())
              ],
            ),
            body: MultiBlocProvider(
                providers: [
                  BlocProvider(
                      create: (context) =>
                          MenuNavigatorBloc(controller: _myPage)),
                  ...blocProviders
                ],
                child: Stack(
                  children: <Widget>[
                    PageView(
                      controller: _myPage,
                      children: <Widget>[
                        HomeScreen(
                            tokenUser: widget.tokenUser,
                            userName: widget.userName), // NOTE 0
                        UtilsScreen(userName: widget.userName),
                        ProfileScreen(tokenUser: widget.tokenUser),
                        CreditScreen(
                            oldIndex: currentIndex,
                            tokenUser: widget.tokenUser,
                            userName: widget.userName),
                        BuySharesScreen(
                            oldIndex: currentIndex,
                            userName: widget.userName,
                            tokenUser: widget.tokenUser), // NOTE 4
                        ApprovalsScreen(
                            oldIndex: currentIndex,
                            userName: widget.userName,
                            tokenUser: widget.tokenUser,
                            role: widget.role),
                        StatusCreditRequestWidget(userName: widget.userName),
                        ConfirmationBuyShares(
                            userName: widget.userName,
                            approvals: null), // NOTE 7
                        RulesScreen(
                          tokenUser: widget.tokenUser,
                        ),
                        RulesEditScreen(
                          token: widget.tokenUser,
                        ),
                        AdministratorAssignmentScreen(
                            userName: widget.userName,
                            tokenUser: widget.tokenUser,
                            role: widget.role), // NOTE 10
                        ActiveCreditScreen(
                          oldIndex: currentIndex,
                          userName: widget.userName,
                          token: widget.tokenUser,
                        ),
                        AddPartnerScreen(
                            oldIndex: currentIndex,
                            userName: widget.userName,
                            tokenUser: widget.tokenUser),
                        MeetingClosedScreen(
                            oldIndex: currentIndex,
                            userName: widget.userName,
                            tokenUser: widget.tokenUser,
                            role: widget.role),
                        ProfitPaymentScreen(
                            oldIndex: currentIndex,
                            userName: widget.userName,
                            tokenUser: widget.tokenUser), // NOTE 14
                        PartnerRemovalScreen(
                          oldIndex: currentIndex,
                          userName: widget.userName,
                        ),
                        ExemptionsScreen(
                          oldIndex: currentIndex,
                          userName: widget.userName,
                          tokenUser: widget.tokenUser,
                        ),
                        TimeLineMySharesScreen(
                            userName: widget.userName,
                            tokenUser: widget.tokenUser),
                        TimeLineMyCreditScreen(
                            userName: widget.userName,
                            tokenUser: widget.tokenUser),
                            
                        ProfileEditScreen(
                          token: widget.tokenUser,
                        ),
                        ReportsScreen(userName: widget.userName),
                      ],
                      physics:
                          NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
                    ),
                    MenuActions(
                      oldIndex: currentIndex,
                      hasLoaded: hasLoaded,
                      controller: _animateController,
                      isPressed: () => _buttonPressed(),
                    ),
                    MenuRequests(
                        position: position,
                        onDragEnd: (details) {
                          setState(() => position = details.offset);
                        })
                  ],
                )),
            floatingActionButton: FloatingButton(
              key: Key('option-additional'),
              onPressed: () =>
                  _animateController.isAnimating ? null : _buttonPressed(),
              controller: _animateController,
            )));
  }

  void _buttonPressed() {
    _animateController.isCompleted
        ? _animateController.reverse()
        : _animateController.forward();
    setState(() => hasLoaded = !hasLoaded);
  }
}
