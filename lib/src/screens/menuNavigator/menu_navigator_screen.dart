import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/screens/home/home_screen.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

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
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 380)
    );

    _controller.addListener(() => setState(() {}));
    super.initState();
  }
  bool hasLoaded = false;

  @override
  void dispose() {
    _controller?.dispose();
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
            PageView(
            controller: _myPage,
            onPageChanged: (int) {
              print('Page Changes to index $int');
            },
            children: <Widget>[
              HomeScreen(),
              UtilsScreen(),
              Center(
                child: Container(
                  child: Text('Empty Body 2'),
                ),
              )
            ],
            physics:
                NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
          ),
          MenuActions(
            hasLoaded: hasLoaded,
            controller: _controller
          )
        ],
      ),
      floatingActionButton: FloatingButton(
        key: Key('option-additional'),
        onPressed: () => _controller.isAnimating ? null : _buttonPressed(),
        controller: _controller,
      )
    );
  }

  void _buttonPressed() {
    _controller.isCompleted
    ? _controller.reverse()
    : _controller.forward();
    setState(() => hasLoaded = !hasLoaded);
  }
}
