import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class TextSharesModal extends StatelessWidget {
  const TextSharesModal({Key key}) : super(key: key);

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
                      r'$4.000.000',
                      textAlign: TextAlign.end,
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
                      '12',
                      textAlign: TextAlign.end,
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
                      r'$4.000.000',
                      textAlign: TextAlign.end,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
