import 'package:bkapp_flutter/src/screens/home/home_screen.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          padding: EdgeInsets.only(right: 100, left: 20),
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                key: Key('option-home'),
                iconSize: 30.0,
                icon: SvgPicture.asset('assets/images/home.svg',
                    fit: BoxFit.cover),
                onPressed: () => setState(() => _myPage.jumpToPage(0))
              ),
              IconButton(
                key: Key('option-utils'),
                iconSize: 30.0,
                icon: SvgPicture.asset('assets/images/archive.svg',
                    fit: BoxFit.cover),
                onPressed: () => setState(() => _myPage.jumpToPage(1))
              ),
              IconButton(
                key: Key('option-profile'),
                iconSize: 30.0,
                icon: SvgPicture.asset('assets/images/user.svg',
                    fit: BoxFit.cover),
                onPressed: () => setState(() => _myPage.jumpToPage(2))
              )
            ],
          ),
        ),
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
