import 'dart:ui';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/card_buttons_widget.dart';
import 'package:bkapp_flutter/src/widgets/modals/inviteModal/invite_modal_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'invite_form_Bloc.dart';

//NOTE HOW TO CALL IT:
// showDialog(context: context, builder: (BuildContext context) => InviteModal()),
class InviteModal extends StatelessWidget {
  final content = InviteModalContent();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    BackdropFilter dialog = _popDialog(context);
    return dialog;
  }

  BackdropFilter _popDialog(BuildContext context) {
    return BackdropFilter(
      key: Key('filter_invite_modal'),
      filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
      child: Dialog(
        key: Key('dialog_invite_modal'),
        elevation: 100,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        )),
        child: SingleChildScrollView(
          child: Column(
            key: Key('column_invite_modal'),
            children: <Widget>[
              SizedBox(height: SizeConfig.blockSizeVertical * 10),
              content.closeContainer(context),
              Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 2,
                    bottom: SizeConfig.blockSizeVertical * 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )),
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    content.titleContainer(context),
                    _textsFields(),
                  ],
                ),
              ),
              content.contactButton(context),
              SizedBox(height: SizeConfig.blockSizeVertical * 5),
              content.partnersText(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _textsFields() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          )),
      child: BlocProvider(
        create: (context) => InviteFormBloc(),
        child: Builder(
          builder: (context) {
            return CardButtonsWidget(
                acceptText: I18n.of(context).inviteModalAdd,
                accept: context.bloc<InviteFormBloc>().submit,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextFieldBlocBuilder(
                          key: Key('input_name_invite_modal'),
                          textFieldBloc: context.bloc<InviteFormBloc>().name,
                          errorBuilder: (context, string) =>
                              I18n.of(context).errorRequired,
                          decoration: InputDecoration(
                              labelText: I18n.of(context).inviteModalName,
                              prefixIcon: Icon(Icons.account_circle))),
                      TextFieldBlocBuilder(
                          key: Key('input_phone_invite_modal'),
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          textFieldBloc:
                              context.bloc<InviteFormBloc>().cellPhone,
                          errorBuilder: (context, string) =>
                              I18n.of(context).errorRequired,
                          decoration: InputDecoration(
                              labelText: I18n.of(context).inviteModalCellPhone,
                              prefixIcon: Icon(Icons.phone))),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
