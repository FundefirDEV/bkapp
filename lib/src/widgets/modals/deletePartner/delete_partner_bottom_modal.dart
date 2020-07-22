import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/deletePartner/content/delete_partners_text.dart';
import 'package:flutter/material.dart';
import 'content/delete_partners_buttons.dart';

//NOTE HOW TO CALL IT:
// showModalBottomSheet(context: context, builder: (BuildContext context) => DeletePartnerModal()),
class DeletePartnerModal extends StatelessWidget {
  final onSave;

  const DeletePartnerModal({Key key, @required this.onSave}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Container dialog = _popDialog(context);
    return dialog;
  }

  Container _popDialog(BuildContext context) {
    return Container(
      key: Key('main_container_delete_partner_modal'),
      color: Color(0xFF737373),
      child: Container(
        key: Key('internal_container_delete_partner_modal'),
        height: SizeConfig.blockSizeVertical * 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Stack(
          key: Key('stack_delete_partner_modal'),
          children: <Widget>[
            DeletePartnersText(),
            DeletePartnersModalButtons(
              onSave: onSave,
            )
          ],
        ),
      ),
    );
  }
}
