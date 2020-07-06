import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/generated/i18n.dart';

class AcceptedDiscarted extends StatelessWidget {
  const AcceptedDiscarted({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      key: Key('Value-approvals-padding'),
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        key: Key('Accepted-approvals-column-container'),
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              key: Key('Approvals-column-text-value'),
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  I18n.of(context).approvalsScreenAccepted,
                  key: Key('Value-acepted-approvals-value-text'),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor,
                      fontSize: SizeConfig.blockSizeHorizontal * 4),
                ),
                Text(
                  "2",
                  key: Key('Accepted-approvals-text-value'),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor[200],
                      fontSize: SizeConfig.blockSizeHorizontal * 6),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              key: Key('Rejected-approvals-column-container'),
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  I18n.of(context).approvalsScreenRejected,
                  key: Key('Value-rejected-approvals'),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor,
                      fontSize: SizeConfig.blockSizeHorizontal * 4),
                ),
                Text(
                  '12',
                  key: Key('Value-rejected-approvals-text'),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor[200],
                      fontSize: SizeConfig.blockSizeHorizontal * 6),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
