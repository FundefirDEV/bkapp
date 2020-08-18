import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/footerNameBkWidget/footer_name_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/select_name_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/title_name_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/bg_bank_register.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NameBkScreen extends StatefulWidget {
  NameBkScreen({Key key}) : super(key: key);

  @override
  _NameBkScreenState createState() => _NameBkScreenState();
}

class _NameBkScreenState extends State<NameBkScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.2, 1.0, curve: Curves.easeIn)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Container(
      key: Key('container-name-bk-screen'),
      child: BgBankRegister(
        child: Column(
          key: Key('column-name-bk-screen'),
          children: <Widget>[
            FadeTransition(opacity: _animation, child: TitleNameBkWidget()),
            Expanded(
                flex: 2,
                child: FadeTransition(
                    opacity: _animation, child: SelectNameBkWidget())),
            FooterNameBkWidget()
          ],
        ),
      ),
    );
  }
}
