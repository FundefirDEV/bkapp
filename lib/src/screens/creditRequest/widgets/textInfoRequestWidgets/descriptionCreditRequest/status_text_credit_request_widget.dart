import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';

class StatusTextCreditRequest extends StatelessWidget {
  const StatusTextCreditRequest(
      {Key key, @required this.installments, this.bottomText})
      : super(key: key);

  final String installments;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('status-text-credit-request-container'),
      margin: EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      child: Column(
        key: Key('status-text-credit-request-column'),
        children: <Widget>[
          Expanded(
            key: Key('status-text-credit-request-expanded'),
            child: Container(
              key: Key('status-text-credit-request-container-status'),
              alignment: Alignment.bottomLeft,
              child: RichText(
                key: Key('status-text-credit-request-container-richtext'),
                textAlign: TextAlign.left,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: I18n.of(context).statusCreditStatus + '\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontSize: SizeConfig.blockSizeHorizontal * 4)),
                    TextSpan(
                        text: 'PENDIENTE',
                        style: TextStyle(
                            letterSpacing: 2,
                            fontSize: SizeConfig.blockSizeHorizontal * 3)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            key: Key('status-text-credit-request-sizedbox'),
            height: 20,
          ),
          Expanded(
            key: Key('status-text-credit-request-expanded-dues'),
            child: Container(
              key: Key('status-text-credit-request-container-dues'),
              alignment: Alignment.topLeft,
              child: RichText(
                key: Key('status-text-credit-request-text-dues'),
                textAlign: TextAlign.left,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: bottomText != null
                            ? bottomText
                            : I18n.of(context).statusCreditDues + '\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontSize: SizeConfig.blockSizeHorizontal * 4)),
                    TextSpan(
                        text: installments ?? '0',
                        style: TextStyle(
                            letterSpacing: 2,
                            fontSize: SizeConfig.blockSizeHorizontal * 4,
                            fontWeight: bottomText != null
                                ? FontWeight.bold
                                : FontWeight.w100)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
