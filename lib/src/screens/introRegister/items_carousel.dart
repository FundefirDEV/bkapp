import 'package:flutter/material.dart';

class ItemCarousel {
  final Key key;
  final String text1;
  final String text2;
  final String image;
  final String icon;
  final String iconText;
  final Function onPressed;

  ItemCarousel({
    this.key,
    this.icon,
    this.iconText,
    this.text1,
    this.text2,
    this.image,
    this.onPressed
  });
}
