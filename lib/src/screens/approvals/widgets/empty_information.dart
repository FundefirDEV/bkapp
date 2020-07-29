import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';

class EmptyInformation extends StatelessWidget {
  const EmptyInformation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text(
          I18n.of(context).approvalsScreenNoRequest,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}
