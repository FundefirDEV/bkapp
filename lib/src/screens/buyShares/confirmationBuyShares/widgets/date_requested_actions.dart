import 'package:bkapp_flutter/core/models/approvals_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRequestedActions extends StatelessWidget {
  const DateRequestedActions({Key key, this.data}) : super(key: key);

  final ApprovalsModel data;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    DateTime date;
    try {
      date = data.myRequest.sharesRequest.length > 0
          ? DateTime.parse(data.myRequest.sharesRequest[0].requestDate)
          : DateTime.now();
    } catch (e) {
      date = DateTime.now();
    }
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
                  data.myRequest.sharesRequest[0].quantity.toString(),
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
                  DateFormat("dd-MM-yyyy").format(date).toString(),
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
