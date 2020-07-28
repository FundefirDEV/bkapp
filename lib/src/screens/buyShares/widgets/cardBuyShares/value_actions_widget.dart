import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/generated/i18n.dart';

class ValueActions extends StatelessWidget {
  const ValueActions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      key: Key('value-actions-padding'),
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        key: Key('value-actions-column-container'),
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              key: Key('value-actions-column-text-value'),
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  I18n.of(context).buySharesShareValue,
                  key: Key('value-actions-share-value-text'),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor,
                      fontSize: SizeConfig.blockSizeHorizontal * 4),
                ),
                Text(
                  "\$ 10.000",
                  key: Key('value-actions-text-value'),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor[200],
                      fontSize: SizeConfig.blockSizeHorizontal * 6),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              key: Key('value-actions-column-text-number-actions'),
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  I18n.of(context).buySharesActionsAvailable,
                  key: Key('value-actions-action-available'),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor,
                      fontSize: SizeConfig.blockSizeHorizontal * 4),
                ),
                Text(
                  '9',
                  key: Key('value-actions-number-actios-text'),
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
