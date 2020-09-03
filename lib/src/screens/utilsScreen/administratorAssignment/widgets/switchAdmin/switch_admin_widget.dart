import 'package:bkapp_flutter/core/bloc/administratorAsignmentBloc/administrator_asignment_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SwitchAdmin extends StatefulWidget {
  SwitchAdmin(
      {Key key,
      this.partnerName,
      this.isAdmin,
      this.customKey,
      this.bloc,
      this.token,
      this.phone,
      this.role})
      : super(key: key);
  final Key customKey;
  final String partnerName;
  final String phone;
  final bool isAdmin;
  final String token;
  final String role;
  final bloc;
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
    bool isAdmin = widget.role != 'admin';
    Color thumbColor = isAdmin ? Colors.grey.shade400 : null;
    Color trackColor = isAdmin ? Colors.white30 : null;
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
              inactiveThumbColor: thumbColor,
              inactiveTrackColor: trackColor,
              activeTrackColor: trackColor,
              activeColor: thumbColor,
              onChanged: (value) {
                if (!isAdmin) {
                  setState(() => stateSwitchAdmin = value);
                  _showDialog(context, value, () {
                    Navigator.pop(context);
                    widget.bloc.add(AdministratorAsignmentPost(
                        token: widget.token,
                        name: widget.partnerName,
                        phone: widget.phone,
                        partnerType: value == true ? "admin" : "partner"));
                  });
                }
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

  void _showDialog(context, value, Function function) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return ImageBottomModal(
            modalHeight: 50.0,
            image: 'assets/images/salo_pre_approved_modal.svg',
            isImageBg: true,
            title: value
                ? I18n.of(context).administratorAssignmentTitleModalAssign
                : I18n.of(context).administratorAssignmentTitleModalRemove,
            titleBold: '',
            isBold: false,
            isBtnAccept: true,
            titleAcceptButton: I18n.of(context).administratorAssignmentAccept,
            titleCloseButton: I18n.of(context).administratorAssignmentClose,
            onPressAccept: function,
            onPressCancel: () {
              setState(() => stateSwitchAdmin = !value);
              Navigator.pop(context);
            },
          );
        });
  }
}
