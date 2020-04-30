import 'package:bkapp_flutter/src/screens/userFllInfo/widgets/registerName/register_name_step_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_next_widget.dart';
import 'package:flutter/material.dart';

class RegisterUserStepsScreen extends StatelessWidget {
  const RegisterUserStepsScreen({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
        child: SafeArea(
            child: Column(
      children: <Widget>[ButtonBackWidget(), Expanded(child: _containerInfo())],
    )));
  }

  Widget _containerInfo() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(flex: 2, child: RegisterNameStepWidget()),
          Expanded(
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(children: <Widget>[
                    Expanded(child: _stepContainer()),
                    Expanded(
                        child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockVertical * 3,
                                vertical: SizeConfig.safeBlockVertical * 3),
                            child: ButtonNextWidget(
                              onTap: () {print('Siguiente paso');
                            })))
                  ])))
        ]);
  }

  Container _stepContainer() {
    return Container(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 12),
          child: RichText(
            text: TextSpan(
                text: '1',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  color: Colors.grey,
                ),
            children: <TextSpan>[
              TextSpan(
                text: '/4',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                ),
              )
          ]),
      ),
    ));
  }
}
