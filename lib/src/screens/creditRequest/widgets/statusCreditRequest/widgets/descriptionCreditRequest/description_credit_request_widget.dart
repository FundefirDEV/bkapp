import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class DescriptionCreditRequestWidget extends StatelessWidget {
  const DescriptionCreditRequestWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('description-credit-request-container'),
      margin: EdgeInsets.only(left: 20),
      child: Column(
        key: Key('description-credit-request-column'),
        children: <Widget>[
          Expanded(
            key: Key('description-credit-request-expanded-status-request'),
            child: Container(
              key: Key('description-credit-request-container-status-request'),
              alignment: Alignment.bottomLeft,
              child: Column(
                key: Key('description-credit-request-column-status-request'),
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    I18n.of(context).statusCreditValueRequested,
                    key: Key('description-credit-request-text-status-request'),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.grayColor,
                        fontSize: SizeConfig.blockSizeHorizontal * 4),
                  ),
                  Text(
                    "\$ 300.000",
                    key: Key('description-credit-request-text-value'),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.grayColor[200],
                        fontSize: SizeConfig.blockSizeHorizontal * 5),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            key: Key('description-credit-request-sized-box'),
            height: 15,
          ),
          Expanded(
            key: Key('description-credit-request-expanded-date'),
            child: Container(
              key: Key('description-credit-request-container-date'),
              alignment: Alignment.topLeft,
              child: Column(
                key: Key('description-credit-request-column-date'),
                children: <Widget>[
                  Text(
                    I18n.of(context).buySharesApplicationDate,
                    key: Key('description-credit-request-text-date'),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.grayColor,
                        fontSize: SizeConfig.blockSizeHorizontal * 4),
                  ),
                  Text(
                    '20/07/2020',
                    key: Key('description-credit-request-date'),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.grayColor[200],
                        fontSize: SizeConfig.blockSizeHorizontal * 5,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
