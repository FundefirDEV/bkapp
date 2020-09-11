import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DebtProfits extends StatelessWidget {
  const DebtProfits({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: SvgPicture.asset(
              'assets/images/bot_debt.svg',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MultipleButtons(
                  isBtnCancel: false,
                  onPressAccept: () {},
                  titleAcceptButton: I18n.of(context).partnerRemovalPayDebt,
                  fontSize: 12.0,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Container(
                        width: SizeConfig.blockSizeHorizontal * 39,
                        child:
                            Text(I18n.of(context).partnerRemovalYouHaveADebt)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
