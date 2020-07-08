import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardSelected {
  CardSelected({this.img, this.text, this.key});
  final dynamic img;
  final String text;
  final Key key;
}
class SelectedPayInstallmentsWidget extends StatefulWidget {
  SelectedPayInstallmentsWidget({
    Key key,
    this.items,
    this.onTabSelected
  }) : super(key: key);

  final List<CardSelected> items;
  final ValueChanged<String> onTabSelected;

  _SelectedPayInstallmentsWidgetState createState() =>
      _SelectedPayInstallmentsWidgetState();
}

class _SelectedPayInstallmentsWidgetState
    extends State<SelectedPayInstallmentsWidget> {
  String _selectedIndex;

  _updateItem(String item) {
    widget.onTabSelected(item);
    setState(() => _selectedIndex = item);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List<Widget> items = List.generate(
      widget.items.length,
      (int index) {
        return _cardSelectedPay(
          item: widget.items[index],
          index: index,
          onPressed: _updateItem
        );
    });

    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 7.5),
        margin:
            EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 1.5),
        child: Row(children: items));
  }

  Widget _cardSelectedPay({
    CardSelected item,
    int index,
    ValueChanged<String> onPressed
  }) {
    Color border = _selectedIndex == item.text
      ? Theme.of(context).colorScheme.primaryColor
      : Colors.white38;
    Color color = _selectedIndex == item.text
      ? Colors.white
      : Colors.white38;
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => onPressed(item.text),
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 3.5),
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20.0)],
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: border,
                  width: 1.5
                ),
                color: color
            ),
            height: 80,
            child: Stack(
              children: <Widget>[
                new Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomRight: const Radius.circular(10),
                            bottomLeft: const Radius.circular(10)),
                        child: SvgPicture.asset(
                          item.img,
                        ),
                      ),
                    )),
                Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 12.5),
                    child: Text(item.text,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.grayColor,
                            fontSize: SizeConfig.safeBlockHorizontal * 3.8,
                            fontWeight: FontWeight.w100)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
