import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class TextPaymentModal extends StatelessWidget {
  const TextPaymentModal(
      {Key key,
      @required this.totalInstallmentsPays,
      @required this.totalAdvanceInsterest})
      : super(key: key);
  final String totalInstallmentsPays;
  final String totalAdvanceInsterest;
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
                      text: I18n.of(context).meetingClosedPayIn + '\n',
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Theme.of(context).colorScheme.grayColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: I18n.of(context).meetingClosedFees,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: SizeConfig.blockSizeHorizontal * 30,
                    child: Text(
                      totalInstallmentsPays,
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
                      text: I18n.of(context).meetingClosedPayFor + '\n',
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Theme.of(context).colorScheme.grayColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: I18n.of(context).meetingClosedAdvance,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: SizeConfig.blockSizeHorizontal * 30,
                    child: Text(
                      // advance interest
                      totalAdvanceInsterest,
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
                      text: I18n.of(context).meetingClosedInterests + '\n',
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Theme.of(context).colorScheme.grayColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: I18n.of(context).meetingClosedDefault,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: SizeConfig.blockSizeHorizontal * 30,
                    child: Text(
                      r'$0',
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
