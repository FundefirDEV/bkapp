import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class DateRequestedActions extends StatelessWidget {
  const DateRequestedActions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      key: Key('date-requested-action-padding'),
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        key: Key('date-requested-action-column-contain'),
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  I18n.of(context).buySharesRequestedActions,
                  key: Key('date-requested-action-text-requested-actions'),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor,
                      fontSize: SizeConfig.blockSizeHorizontal * 4),
                ),
                Text(
                  "5",
                  key: Key('date-requested-action-text-quantity'),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor[200],
                      fontSize: SizeConfig.blockSizeHorizontal * 5),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  I18n.of(context).buySharesApplicationDate,
                  key: Key('date-requested-action-text-application-date'),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor,
                      fontSize: SizeConfig.blockSizeHorizontal * 4),
                ),
                Text(
                  '10/05/2020',
                  key: Key('date-requested-action-date'),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor[200],
                      fontSize: SizeConfig.blockSizeHorizontal * 5,
                      letterSpacing: 1),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
