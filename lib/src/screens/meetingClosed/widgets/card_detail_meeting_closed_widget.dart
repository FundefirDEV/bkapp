import 'package:bkapp_flutter/src/screens/approvals/widgets/empty_information.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/buySharesModal/buy_shares_modal_content.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/creditAwardedModal/credit_awarded_modal_content.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardDetailMeetingClosedWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final String value;
  final String descriptionValue;

  const CardDetailMeetingClosedWidget(
      {Key key,
      this.title,
      this.image,
      this.value,
      this.subTitle,
      this.descriptionValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        width: SizeConfig.safeBlockHorizontal * 100,
        height: 150,
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.safeBlockVertical * 2,
            horizontal: SizeConfig.safeBlockHorizontal * 3),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.grayColor.withOpacity(0.3),
              offset: Offset(0, 2),
              blurRadius: 12,
              spreadRadius: 0)
        ]),
        child: InkWell(
          onTap: () => _showDialog(context, image),
          child: Column(
            children: <Widget>[
              _titleCard(context),
              _containerCard(context),
            ],
          ),
        ));
  }

  Expanded _containerCard(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                      alignment: Alignment.center,
                      child: Container(
                        child: SvgPicture.asset('assets/images/$image.svg',
                            fit: BoxFit.contain),
                      ))),
              Expanded(
                  flex: 3,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          key: Key(''),
                          text: TextSpan(
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.grayColor,
                                  fontFamily: 'Nunito',
                                  fontSize: 20,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w200),
                              children: [
                                TextSpan(text: value),
                                TextSpan(
                                    text: descriptionValue.length > 0
                                        ? '\n$descriptionValue'
                                        : '',
                                    style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w700)),
                              ]))))
            ],
          ),
        ));
  }

  Expanded _titleCard(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryColor[100],
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: RichText(
                      key: Key(''),
                      text: TextSpan(
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Nunito',
                              fontSize: 13.5,
                              fontWeight: FontWeight.w700),
                          children: [
                            TextSpan(text: title.length > 0 ? '$title\n' : ''),
                            TextSpan(
                                text: subTitle,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w200)),
                          ]))),
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: SizeConfig.safeBlockVertical * 2.8),
                        child: SvgPicture.asset('assets/images/path.svg',
                            fit: BoxFit.contain),
                      )))
            ],
          ),
        ));
  }

  void _showDialog(context, type) {
    SizeConfig().init(context);
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return BottomModal(
              height: SizeConfig.blockSizeVertical * 85,
              child: SingleChildScrollView(child: modalContent(type)));
        });
  }

  StatelessWidget modalContent(type) {
    switch (type) {
      case 'shares_bought':
        return BuyShareModalContent(image: type);
        break;
      case 'credit_given':
        return CreditAwardedModalContent(image: type);
        break;
      default:
        return EmptyInformation();
    }
  }
}
