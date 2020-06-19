import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  final double indicatorHeight;

  CustomTabIndicator({this.indicatorHeight = 25.0});

  @override
  _CustomPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;
  double get indicatorHeight => decoration.indicatorHeight;
  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
    final Rect rect = Offset(offset.dx,
            (configuration.size.height / 2) - (indicatorHeight / 2)) &
        Size(configuration.size.width, indicatorHeight);
    final Paint paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.2;
    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(50.0)), paint);
  }
}
