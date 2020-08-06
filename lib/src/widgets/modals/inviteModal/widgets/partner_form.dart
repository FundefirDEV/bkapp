import 'package:bkapp_flutter/core/bloc/bankRegisterBloc/bank_register_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/errorHandler/error_handler.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/card_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class PartnerForm extends StatefulWidget {
  const PartnerForm(
      {Key key, @required this.bankBloc, @required this.addPartner})
      : super(key: key);

  final BankRegisterBloc bankBloc;
  final Function addPartner;

  @override
  _PartnerFormState createState() => _PartnerFormState();
}

class _PartnerFormState extends State<PartnerForm> {
  int minNameValue = 5;
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
                        textFieldBloc: widget.bankBloc.inviteForm.name,
                        onChanged: (value) => _isEmpty(widget.bankBloc),
                        errorBuilder: (context, string) =>
                            I18n.of(context).errorRequired,
                        decoration: InputDecoration(
                            labelText: I18n.of(context).inviteModalName,
                            prefixIcon: Icon(Icons.account_circle))),
                    TextFieldBlocBuilder(
                        key: Key('input_phone_invite_modal'),
                        textFieldBloc: widget.bankBloc.inviteForm.cellPhone,
                        onChanged: (value) => _isEmpty(widget.bankBloc),
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
              ))),
    );
  }

  _isEmpty(BankRegisterBloc bankBloc) {
    bankBloc.inviteForm.name.value.length > minNameValue &&
            bankBloc.inviteForm.cellPhone.value.length > minPhoneValue
        ? setState(() => isDisabled = false)
        : setState(() => isDisabled = true);
  }
}
