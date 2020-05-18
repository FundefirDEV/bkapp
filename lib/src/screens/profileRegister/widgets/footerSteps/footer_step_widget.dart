import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_next_widget.dart';
import 'package:flutter/material.dart';

class FooterStepWidget extends StatelessWidget {
  final int currentStep;
  final int numberOfSteps;
  final String route;
  final Object renderNextWidget;

  const FooterStepWidget(
      {Key key,
      @required this.currentStep,
      @required this.numberOfSteps,
      @required this.route,
      this.renderNextWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        child: Row(children: <Widget>[
          Expanded(child: _stepContainer()),
          Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockVertical * 3,
                      vertical: SizeConfig.safeBlockVertical * 5),
                  child: ButtonNextWidget(onTap: () {
                    _nextStepWidget(context);
                  })))
        ]));
  }

  void _nextStepWidget(BuildContext context) {
    Navigator.pushNamed(context, this.route, arguments: this.renderNextWidget);
  }

  Container _stepContainer() {
    return Container(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 12),
          child: RichText(
            text: TextSpan(
                text: currentStep.toString(),
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  color: Colors.grey,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '/${numberOfSteps.toString()}',
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                    ),
                  )
                ]),
          ),
        ));
  }
}
