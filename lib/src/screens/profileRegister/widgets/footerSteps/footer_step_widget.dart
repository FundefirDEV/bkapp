import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_next_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class FooterStepWidget extends StatelessWidget {
  const FooterStepWidget(
      {Key key,
      @required this.currentStep,
      @required this.numberOfSteps,
      @required this.isDisabled,
      this.currentBlocSubmit})
      : super(key: key);

  final int currentStep;
  final int numberOfSteps;
  final Function currentBlocSubmit;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 55, right: 40),
      child: Container(
          height: 200,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _stepContainer(context),
                Container(
                  child: isDisabled
                      ? Container()
                      : ButtonNextWidget(onTap: currentBlocSubmit),
                )
              ])),
    );
  }

  Container _stepContainer(BuildContext context) {
    return Container(
        child: RichText(
      text: TextSpan(
          text: currentStep.toString(),
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 4,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
            color: Theme.of(context).colorScheme.grayColor,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '/${numberOfSteps.toString()}',
              style: TextStyle(
                fontWeight: FontWeight.w200,
              ),
            )
          ]),
    ));
  }
}
