import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
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

import 'widgets/widgets.dart';

class MenuNavigatorScreen extends StatefulWidget {
  MenuNavigatorScreen({Key key, this.tokenUser, this.userName})
      : super(key: key);
  final String tokenUser;
  final String userName;
  @override
  _MenuNavigatorState createState() => _MenuNavigatorState();
}

class _MenuNavigatorState extends State<MenuNavigatorScreen>
    with SingleTickerProviderStateMixin {
  PageController _myPage = PageController(initialPage: 0);
  AnimationController _animateController;
  Offset position = Offset(20.0, 20.0);

  bool hasLoaded = false;
  int currentIndex = 0;

  @override
  void initState() {
    _animateController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 380));

    _animateController.addListener(() => setState(() {}));
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
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
                  create: (context) => MenuNavigatorBloc(controller: _myPage)),
              BlocProvider(
                create: (context) =>
                    BuySharesFormBloc(repository: shareRepository),
              ),
              BlocProvider(
                create: (context) =>
                    ApprovalsBloc(repository: approvalsRepository),
              ),
              BlocProvider(
                create: (context) => BuySharesBloc(
                    repoApproval: approvalsRepository,
                    repoHome: homeRepository),
              ),
              BlocProvider(
                  create: (context) => context.bloc<AppBloc>().homeBloc),
              BlocProvider(
                create: (context) =>
                  CreditFormBloc(creditRepository: creditRepository),
              ),
              BlocProvider(
                create: (context) => ApprovalsBloc(repository: approvalsRepository)
              )
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
                    ProfileScreen(),
                    CreditScreen(
                      oldIndex: currentIndex,
                      tokenUser: widget.tokenUser,
                      userName: widget.userName
                    ),
                    BuySharesScreen(
                        oldIndex: currentIndex,
                        userName: widget.userName,
                        tokenUser: widget.tokenUser), // NOTE 4
                    ApprovalsScreen(
                        oldIndex: currentIndex,
                        userName: widget.userName,
                        tokenUser: widget.tokenUser),
                    StatusCreditRequestWidget(userName: widget.userName),
                    ConfirmationBuyShares(
                        userName: widget.userName,
                        tokenUser: widget.tokenUser), // NOTE 7
                    RulesScreen(),
                    RulesEditScreen(),
                    AdministratorAssignmentScreen(
                        userName: widget.userName), // NOTE 10
                    ActiveCreditScreen(
                        oldIndex: currentIndex, userName: widget.userName),
                    AddPartnerScreen(
                        oldIndex: currentIndex, userName: widget.userName),
                    MeetingClosedScreen(
                        oldIndex: currentIndex, userName: widget.userName),
                    ProfitPaymentScreen(userName: widget.userName) // NOTE 14
                  ],
                  physics:
                      NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
                ),
                MenuActions(
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
            ),
          ),
          floatingActionButton: FloatingButton(
            key: Key('option-additional'),
            onPressed: () =>
                _animateController.isAnimating ? null : _buttonPressed(),
            controller: _animateController,
          )),
    );
  }

  void _buttonPressed() {
    _animateController.isCompleted
        ? _animateController.reverse()
        : _animateController.forward();
    setState(() => hasLoaded = !hasLoaded);
  }
}
