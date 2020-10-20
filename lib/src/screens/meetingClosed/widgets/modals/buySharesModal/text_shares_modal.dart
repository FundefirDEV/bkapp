import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class TextSharesModal extends StatelessWidget {
  const TextSharesModal(
      {Key key,
      @required this.newCashBalance,
      @required this.lastCashBalance,
      @required this.payShares})
      : super(key: key);
  final String newCashBalance;
  final String lastCashBalance;
  final String payShares;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Container(
                  width: SizeConfig.blockSizeHorizontal * 50,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: I18n.of(context)
                          .meetingClosedCashBalance
                          .toUpperCase(),
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Theme.of(context).colorScheme.grayColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: I18n.of(context).meetingClosedPrevious,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: SizeConfig.blockSizeHorizontal * 30,
                    child: Text(
                      lastCashBalance,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.grayColor[200]),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Container(
                  width: SizeConfig.blockSizeHorizontal * 50,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: I18n.of(context).meetingClosedPurchased + '\n',
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Theme.of(context).colorScheme.grayColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: I18n.of(context).meetingClosedShares,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: SizeConfig.blockSizeHorizontal * 30,
                    child: Text(
                      payShares,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.grayColor[200]),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Container(
                  width: SizeConfig.blockSizeHorizontal * 50,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: I18n.of(context)
                          .meetingClosedCashBalance
                          .toUpperCase(),
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Theme.of(context).colorScheme.grayColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: I18n.of(context).meetingClosedCurrent,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: SizeConfig.blockSizeHorizontal * 30,
                    child: Text(
                      newCashBalance,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.grayColor[200]),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
