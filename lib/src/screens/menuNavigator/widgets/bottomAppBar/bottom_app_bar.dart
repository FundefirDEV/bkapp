import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarItem {
  BottomBarItem({this.iconData, this.text, this.key});
  final dynamic iconData;
  final String text;
  final Key key;
}

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar(
      {Key key,
      this.items,
      this.onTabSelected,
      this.selectedColor,
      this.color,
      this.height: 60.0,
      this.iconSize,
      this.notchedShape})
      : super(key: key);

  final List<BottomBarItem> items;
  final ValueChanged<int> onTabSelected;
  final Color selectedColor;
  final Color color;
  final double height;
  final double iconSize;
  final NotchedShape notchedShape;

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
          item: widget.items[index], index: index, onPressed: _updateIndex);
    });

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Container(
        padding: EdgeInsets.only(right: 100, left: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items,
        ),
      ),
    );
  }

  Widget _buildTabItem(
      {BottomBarItem item, int index, ValueChanged<int> onPressed}) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;

    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            key: item.key,
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(item.iconData,
                    color: color, height: widget.iconSize),
                SizedBox(height: 5.0),
                Text(
                  item.text,
                  style: TextStyle(
                      color: color,
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
