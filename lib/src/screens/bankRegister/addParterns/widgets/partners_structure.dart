import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/widgets.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/inviteModal/invite_modal.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class PartnersStructureWidget extends StatelessWidget {
  const PartnersStructureWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final childrenData = <Widget>[];
    for (var i = 0; i < 10; i++) {
      childrenData.add(new PartnerCardWidget(
        name: 'Daniel Tavera',
        mobile: '3023901035'
      ));
    }

    return Align(
      key: Key('Align-partner-structure'),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          key: Key('column-partner-structure'),
          children: <Widget>[
            Text(I18n.of(context).bankRegisterAddPartnersTitle.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 4,
                fontWeight: FontWeight.w700,
                letterSpacing: 10.18,
              )
            ),
            Expanded(
              key: Key('expanded-partner-structure'),
              child: Scrollbar(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 2
                  ),
                  child: GridView.count(
                    key: Key('gridview-partner-structure'),
                    primary: false,
                    padding: const EdgeInsets.symmetric(
                      vertical: 0.0,
                      horizontal: 25.0
                    ),
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 0.0,
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    children: childrenData
                  ),
                ),
              ),
            ),
            Padding(
              key: Key('padding-minimum-allowed'),
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 3
              ),
              child: _minimumPartnersAllowed(context)
            ),
            ButtonLineRoundedWidget(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => InviteModal()
              ),
              firstText: I18n.of(context).bankRegisterAddPartnersButtonAdd,
              secondText: I18n.of(context).bankRegisterAddPartnersButtonPartner,
            )
          ],
        ),
      ),
    );
  }

  Widget _minimumPartnersAllowed(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: SizeConfig.blockSizeHorizontal * 4.5,
          fontWeight: FontWeight.w200,
          letterSpacing: 0.5
        ),
        children: <TextSpan>[
          TextSpan(
            text: I18n.of(context).bankRegisterAddPartnersMinimum
          ),
          TextSpan(
            text:  I18n.of(context).bankRegisterAddPartnersEight,
            style: TextStyle(
              fontWeight: FontWeight.w700
            )
          ),
          TextSpan(
            text:  I18n.of(context).bankRegisterAddPartnersTitle,
          )
        ]
      ),
    );
  }
}
