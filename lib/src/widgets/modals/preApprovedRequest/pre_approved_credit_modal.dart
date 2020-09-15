import 'dart:ui';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

//NOTE HOW TO CALL IT:
// showModalBottomSheet(context: context, builder: (BuildContext context) => PreApprovedCreditModal()),
class PreApprovedCreditModal extends StatelessWidget {
  PreApprovedCreditModal({Key key, @required this.tokenUser}) : super(key: key);

  final String tokenUser;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Container dialog = _popDialog(context);
    return dialog;
  }

  Container _popDialog(BuildContext context) {
    return Container(
      key: Key('Main_container_credit_modal'),
      color: Color(0xFF737373),
      child: Container(
        key: Key('Internal_container_credit_modal'),
        height: SizeConfig.blockSizeVertical * 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Stack(
          key: Key('Stack_credit_modal'),
          children: <Widget>[
            buildSaloAndText(context),
            SvgPicture.asset('assets/images/confetti_2.svg'),
            closeButton(context)
          ],
        ),
      ),
    );
  }

  Align buildSaloAndText(context) {
    return Align(
        alignment: Alignment.center,
        child: Column(
          key: Key('Column_credit_modal'),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildRichText(context),
            SvgPicture.asset('assets/images/salo_pre_approved_modal.svg'),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            )
          ],
        ));
  }

  Align closeButton(BuildContext context) => Align(
      alignment: Alignment.bottomCenter,
      child: FlatButton(
          key: Key('FlatButton_credit_modal'),
          onPressed: () {
            Navigator.pop(context);
            BlocProvider.of<ApprovalsBloc>(context)
                .add(ApprovalsInitialize(token: tokenUser));
          },
          child: Text(
            I18n.of(context).actionTextClose,
            style: TextStyle(
              color: Theme.of(context).colorScheme.grayColor,
              fontSize: 11,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 2.79,
            ),
          )));

  RichText buildRichText(context) {
    return RichText(
        key: Key('RichText_credit_modal'),
        textAlign: TextAlign.center,
        text: TextSpan(
            text: I18n.of(context).preApprovedCreditModalCreditrequest + '\n',
            style: TextStyle(
              fontFamily: 'Nunito',
              color: Theme.of(context).colorScheme.grayColor,
              fontSize: 20,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
            ),
            children: <TextSpan>[
              TextSpan(
                  text:
                      I18n.of(context).preApprovedCreditModalPreApproved + '\n',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
              TextSpan(
                  text: I18n.of(context).preApprovedCreditModalYourPosition,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Theme.of(context).colorScheme.grayColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  )),
              TextSpan(
                  text: "1",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  )),
            ]));
  }
}
