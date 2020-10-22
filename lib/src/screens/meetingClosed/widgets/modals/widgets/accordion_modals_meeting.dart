import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AccordionModalsMeeting extends StatelessWidget {
  const AccordionModalsMeeting({Key key, this.children, this.titleAccordion})
      : super(key: key);

  final List<Widget> children;
  final String titleAccordion;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 85,
      margin: EdgeInsets.only(top: 25),
      child: Accordion(
        iconColor: Colors.white,
        isUnderline: false,
        headerBackgroundColor: Theme.of(context).colorScheme.primaryColor[100],
        title: _titleAccordion(context, titleAccordion),
        children: children,
      ),
    );
  }
}

Container _titleAccordion(BuildContext context, String titleAccordion) {
  final String purchasedTitle = titleAccordion.toUpperCase();
  return Container(
      padding: EdgeInsets.only(left: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(purchasedTitle,
            style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 4,
                color: Colors.white,
                fontWeight: FontWeight.bold))
      ]));
}
