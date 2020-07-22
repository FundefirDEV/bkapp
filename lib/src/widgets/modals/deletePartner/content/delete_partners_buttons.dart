import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class DeletePartnersModalButtons extends StatelessWidget {
  const DeletePartnersModalButtons({
    Key key,
    @required this.onSave,
  }) : super(key: key);
  final onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('main_container_delete_partner_modal_button'),
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
      child: Row(
          key: Key('row_delete_partner_modal_button'),
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[deleteButton(context), closeButton(context)]),
    );
  }

  Align deleteButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: RaisedButton(
        key: Key('delete_button_partner_modal_button'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: Theme.of(context).colorScheme.primaryColor[200],
        onPressed: onSave,
        child: Text(
          I18n.of(context).deletePartnerModalDelete,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: 2.79,
          ),
        ),
      ),
    );
  }

  Align closeButton(BuildContext context) => Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(left: SizeConfig.blockSizeVertical * 1.5),
        child: FlatButton(
            key: Key('clode_button_partner_modal_button'),
            onPressed: () => Navigator.pop(context),
            child: Text(
              I18n.of(context).actionTextClose,
              style: TextStyle(
                color: Theme.of(context).colorScheme.grayColor,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: 2.79,
              ),
            )),
      ));
}
