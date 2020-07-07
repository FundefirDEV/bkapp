import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/screens/home/home_screen.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'widgets/widgets.dart';

class MenuNavigatorScreen extends StatefulWidget {
  MenuNavigatorScreen({Key key}) : super(key: key);
  @override
  _MenuNavigatorState createState() => _MenuNavigatorState();
}

class _MenuNavigatorState
  extends State<MenuNavigatorScreen>
  with SingleTickerProviderStateMixin {
  PageController _myPage = PageController(initialPage: 0);
  AnimationController _animateController;

  @override
  void initState() {
    _animateController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 380)
    );

    _animateController.addListener(() => setState(() {}));
    super.initState();
  }
  bool hasLoaded = false;

  @override
  void dispose() {
    _animateController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: CustomBottomBar(
        notchedShape: CircularNotchedRectangle(),
        color: Theme.of(context).colorScheme.grayColor[200],
        selectedColor: Theme.of(context).colorScheme.primaryColor,
        onTabSelected: (index) => _myPage.jumpToPage(index),
        items: [
          BottomBarItem(
            key: Key('home-bottom-bar-item'),
            iconData: 'assets/images/home.svg',
            text: I18n.of(context).mainMenuBarHome.toUpperCase()
          ),
          BottomBarItem(
            key: Key('utils-bottom-bar-item'),
            iconData: 'assets/images/archive.svg',
            text: I18n.of(context).mainMenuBarUtils.toUpperCase()
          ),
          BottomBarItem(
            key: Key('profile-bottom-bar-item'),
            iconData: 'assets/images/user.svg',
            text: I18n.of(context).mainMenuBarProfile.toUpperCase()
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          BlocProvider(
            create: (context) => MenuNavigatorBloc(
              controller: _myPage
            ),
            child: PageView(
              controller: _myPage,
              children: <Widget>[
                HomeScreen(),
                UtilsScreen(),
                Center(
                  child: Container(
                    child: Text('Empty Body 3'),
                  ),
                ),
                Center(
                  child: Container(
                    height: 100.0,
                    width:  100.0,
                    color: Colors.redAccent,
                    child: Text('Empty Body 4'),
                  ),
                ),
              ],
              physics: NeverScrollableScrollPhysics(),// Comment this if you need to use Swipe.
            ),
          ),
          MenuActions(
            hasLoaded: hasLoaded,
            controller: _animateController
          )
        ],
      ),
      floatingActionButton: FloatingButton(
        key: Key('option-additional'),
        onPressed: () => _animateController.isAnimating ? null : _buttonPressed(),
        controller: _animateController,
      )
    );
  }

  void _buttonPressed() {
    _animateController.isCompleted
    ? _animateController.reverse()
    : _animateController.forward();
    setState(() => hasLoaded = !hasLoaded);
  }
}