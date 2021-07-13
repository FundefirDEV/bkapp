import 'package:bkapp_flutter/core/bloc/partnersBloc/invite_form_bloc.dart';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/core/services/api/http_requests.dart';
import 'package:bkapp_flutter/environment_config.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/errorHandler/error_handler.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/card_buttons_widget.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:http/http.dart' as http;

class PartnerFormRegisterBank extends StatefulWidget {
  const PartnerFormRegisterBank({ 
      Key key, 
      @required this.inviteBloc ,
      @required this.token ,
      @required this.addPartner,
      @required this.partnerList
    })
      : super(key: key
    );

  final InviteFormBloc inviteBloc;
  final String token;
  final Function addPartner;
  final List<PartnerModel> partnerList;

  @override
  _PartnerFormRegisterBankState createState() => _PartnerFormRegisterBankState();
}

class _PartnerFormRegisterBankState extends State<PartnerFormRegisterBank> {
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
            accept: isDisabled ? null : () => _addPartnerForm(context),
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
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(14),
                      PhoneFormatter()
                    ],
                    errorBuilder: errorHandler,
                    decoration: InputDecoration(
                      labelText: I18n.of(context).inviteModalCellPhone,
                      prefixIcon: Icon(Icons.phone)
                    )
                  ),
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


  _addPartnerForm(BuildContext context) async {
    
    print(' ********** DATA ********** ');
    print(widget.inviteBloc.name.value);
    print(widget.inviteBloc.cellPhone.value);

    _submitContacts(context ,widget.inviteBloc.name.value , widget.inviteBloc.cellPhone.value );
  }

    void _submitContacts(BuildContext context , String name , String phone) async {

    final clearPhone = phone.replaceAll(RegExp(r'[()!@#<>?":_`~;[\]\\|=+-\s\b|\b\s]'), '');

    final List<String> allPhones = [];

    widget.partnerList.forEach((p) { 
      allPhones.add(p.phone);
    });

    if(allPhones.contains(phone)){
      _showDialog(context , '$phone already exist');
      return;      
    }

    try {

      final res = await validatePhone(widget.token, clearPhone);
      print(res);

      widget.addPartner([PartnerModel(
        firstname: name,
        phone: phone
      )]);

      Navigator.pop(context);
      setState(() {});
      
    } catch (e) {
      _showDialog(context , e.toString());      
    }
    
  }
}

Future<String> validatePhone(
  String token, String phone) async {

  http.Client httpClient = http.Client();
  HttpRequests _httpRequest = HttpRequests();
  final postInvitePartner = ApiEndpoints.validatePhone();
  return await _httpRequest.get(
    httpClient: httpClient,
    url: postInvitePartner,
    token: token,
    param: phone,
  );
}

void _showDialog(context , String error) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (_) {
      return ImageBottomModal(
        modalHeight: 45.0,
        image: 'assets/images/sad_bot.svg',
        title: I18n.of(context).requestErrorUserNotAvailable,
        isBold: true,
        isBtnAccept: false,
        isImageBg: false,
        titleCloseButton: I18n.of(context).administratorAssignmentClose,
        onPressCancel: ()=> Navigator.pop(context),
        technicalData: error,
    );
  });
}


