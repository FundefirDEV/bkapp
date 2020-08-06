import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SwitchAdmin extends StatefulWidget {
  SwitchAdmin(
      {Key key, this.partnerName, this.isAdmin, this.callback, this.customKey})
      : super(key: key);
  final Key customKey;
  final String partnerName;
  final bool isAdmin;
  final Function callback;
  @override
  SwitchAdminState createState() => SwitchAdminState();
}

class SwitchAdminState extends State<SwitchAdmin> {
  bool stateSwitchAdmin;
  @override
  void initState() {
    super.initState();
    stateSwitchAdmin = widget.isAdmin;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      key: Key('row_switch_admin'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          key: Key('container_switch_admin'),
          width: SizeConfig.blockSizeHorizontal * 30,
          alignment: Alignment.center,
          child: Material(
            key: Key('material_switch_admin'),
            color: Colors.transparent,
            child: Switch(
              key: widget.customKey,
              dragStartBehavior: DragStartBehavior.down,
              value: stateSwitchAdmin,
              onChanged: (value) {
                setState(() => stateSwitchAdmin = value);
                widget.callback(context, value);
              },
            ),
          ),
        ),
        Container(
            key: Key('text_container_switch_admin'),
            width: SizeConfig.blockSizeHorizontal * 40,
            alignment: Alignment.center,
            child: Text(
              widget.partnerName,
              key: Key('text_switch_admin'),
            ))
      ],
    );
  }
}
