import 'package:flutter/material.dart';

class MenuAnimation {
  MenuAnimation(this.controller)
  : iconRotation = Tween<double>(begin: 90.0, end: -45.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut
      )
    ),
    colorAnimation = ColorTween(
      begin: Color(0xFF1D88C0),
      end: Color(0xFFE96161)
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut
      )
    );

  AnimationController controller;
  Animation<double> iconRotation;
  Animation<Color> colorAnimation;
}
