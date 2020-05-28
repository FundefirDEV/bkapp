import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/bg_bank_register.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/widgets.dart';

import 'widgets/widgets.dart';

class AddPartnersRegisterScreen extends StatefulWidget {
  const AddPartnersRegisterScreen({Key key}) : super(key: key);

  @override
  _AddPartnersRegisterScreenState createState() => _AddPartnersRegisterScreenState();
}

class _AddPartnersRegisterScreenState
  extends State<AddPartnersRegisterScreen>
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
      parent: _controller,
      curve: Interval(0.2, 1.0, curve: Curves.easeIn)
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _controller.forward();

    return Container(
      key: Key('container-bk-partner-screen'),
       child: BgBankRegister(
        child: Column(
          key: Key('column-bk-partner-screen'),
          children: <Widget>[
            TitleBkWidget(
              firstText: I18n.of(context).bankRegisterAddPartnersFirstTitle,
              secondText: I18n.of(context).bankRegisterAddPartnersSecondText
            ),
            Expanded(
              key: Key('expanded-bk-partner-screen'),
              flex: 2,
              child: FadeTransition(
                opacity: _animation,
                child: PartnersStructureWidget()
              )
            ),
            FooterBkWidget()
          ],
        ),
       ),
    );
  }
}
