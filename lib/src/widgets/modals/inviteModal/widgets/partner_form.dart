import 'package:bkapp_flutter/core/bloc/partnersBloc/invite_form_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/errorHandler/error_handler.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/card_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class PartnerForm extends StatefulWidget {
  const PartnerForm(
      {Key key, @required this.inviteBloc, @required this.addPartner})
      : super(key: key);

  final InviteFormBloc inviteBloc;
  final Function addPartner;

  @override
  _PartnerFormState createState() => _PartnerFormState();
}

class _PartnerFormState extends State<PartnerForm> {
  int minNameValue = 1;
  int minPhoneValue = 12;
  bool isDisabled;

  @override
  void initState() {
    super.initState();
    isDisabled = true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              )),
          child: CardButtonsWidget(
              acceptText: I18n.of(context).inviteModalAdd,
              accept: isDisabled ? null : () => widget.addPartner(),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFieldBlocBuilder(
                        key: Key('input_name_invite_modal'),
                        textFieldBloc: widget.inviteBloc.name,
                        onTap: () => _isEmpty(widget.inviteBloc),
                        onChanged: (value) => _isEmpty(widget.inviteBloc),
                        errorBuilder: (context, string) =>
                            I18n.of(context).errorRequired,
                        decoration: InputDecoration(
                            labelText: I18n.of(context).inviteModalName,
                            prefixIcon: Icon(Icons.account_circle))),
                    TextFieldBlocBuilder(
                        key: Key('input_phone_invite_modal'),
                        textFieldBloc: widget.inviteBloc.cellPhone,
                        onTap: () => _isEmpty(widget.inviteBloc),
                        onChanged: (value) => _isEmpty(widget.inviteBloc),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                          PhoneFormatter()
                        ],
                        errorBuilder: errorHandler,
                        decoration: InputDecoration(
                            labelText: I18n.of(context).inviteModalCellPhone,
                            prefixIcon: Icon(Icons.phone))),
                  ],
                ),
              )
          )
      ),
    );
  }

  _isEmpty(InviteFormBloc inviteBloc) {
    inviteBloc.name.value.length > minNameValue &&
            inviteBloc.cellPhone.value.length > minPhoneValue
        ? setState(() => isDisabled = false)
        : setState(() => isDisabled = true);
  }
}
