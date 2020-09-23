import 'package:bkapp_flutter/core/services/sql/partner_sql.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PartnerCardWidget extends StatelessWidget {
  const PartnerCardWidget(
      {Key key,
      @required this.id,
      @required this.name,
      @required this.mobile,
      this.onSave})
      : super(key: key);

  final int id;
  final String name;
  final String mobile;
  final Function onSave;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // ignore: unused_local_variable
    PartnerDatabaseProvider partnerDb = PartnerDatabaseProvider.db;

    return Stack(
      key: Key('first-stack-partner-card'),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15.0, right: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                key: Key('second-stack-partner-card'),
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/user_icon_yellow.svg',
                    width: SizeConfig.safeBlockHorizontal * 10,
                  ),
                  Positioned(bottom: 21.0, right: 10.0, child: _dataPartner())
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: -5.0,
            right: -9.0,
            child: RawMaterialButton(
              onPressed: () => _showModalBankNotAllowed(context),
              elevation: 4.0,
              constraints: BoxConstraints(minWidth: 23.0, minHeight: 23.0),
              shape: CircleBorder(),
              fillColor: Colors.white,
              child: Icon(Icons.close,
                  size: 17.0, color: Theme.of(context).colorScheme.errorColor),
            )),
      ],
    );
  }

  Widget _dataPartner() {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 27,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            maxLines: 2,
            style: TextStyle(
              height: 1,
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            mobile,
            maxLines: 1,
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4),
          )
        ],
      ),
    );
  }

  _showModalBankNotAllowed(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: false,
        enableDrag: false,
        builder: (context) {
          return ImageBottomModal(
            modalHeight: 40.0,
            image: 'assets/images/sad_bot.svg',
            title: I18n.of(context).modalTextsYourBkGroup,
            titleBold: I18n.of(context).modalTextsIsEnabled,
            isBold: true,
            isBtnAccept: false,
            titleCloseButton: I18n.of(context).administratorAssignmentClose,
            onPressCancel: () => Navigator.pop(context),
            buttonsFontSize: 14.0,
          );
        });
  }
}
