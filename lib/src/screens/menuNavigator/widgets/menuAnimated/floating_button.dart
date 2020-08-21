import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';

import 'menu_animation.dart';

class FloatingButton extends StatefulWidget {
  FloatingButton({Key key, @required this.controller, @required this.onPressed})
      : animation = MenuAnimation(controller),
        super(key: key);

  final AnimationController controller;
  final MenuAnimation animation;
  final Function onPressed;

  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    final animation = widget.animation;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(
          UtilsTools.getRadiansFromDegree(animation.iconRotation.value)),
      child: Container(
        key: Key('floating-container'),
        height: 52.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
              key: Key('button-action-plus'),
              backgroundColor: animation.colorAnimation.value,
              onPressed: widget.onPressed,
              child: Icon(Icons.add)),
        ),
      ),
    );
  }
}
