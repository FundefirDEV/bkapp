import 'package:flutter/material.dart';

class BottomModal extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const BottomModal({Key key, this.child, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        key: Key('container_bottom_modal'),
        width: this.width,
        height: this.height,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(36),
                topRight: const Radius.circular(36),
              )),
          child: this.child,
        ));
  }
}
