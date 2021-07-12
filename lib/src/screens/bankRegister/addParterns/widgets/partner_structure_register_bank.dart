import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/models/partner_model.dart';
import 'package:bkapp_flutter/core/services/api/http_requests.dart';
import 'package:bkapp_flutter/environment_config.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/addParterns/widgets/invite_modal_register_bank.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/widgets.dart';import 'package:bkapp_flutter/src/widgets/addPartners/widgets/partner_card_widget.dart';
import 'package:bkapp_flutter/src/widgets/addPartners/widgets/widgets.dart';
import 'package:bkapp_flutter/src/widgets/modals/inviteModal/invite_modal.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:http/http.dart' as http;

class PartnersStructureRegisterBankWidget extends StatefulWidget {
  const PartnersStructureRegisterBankWidget({
    Key key,
    this.colorButton: Colors.transparent,
    this.tokenUser,
    this.gridViewWidth = 25.0,
    this.guest = false,
    this.menuNavigatorBloc
  }) : super(key: key);

  final Color colorButton;
  final String tokenUser;
  final double gridViewWidth;
  final bool guest;
  final MenuNavigatorBloc menuNavigatorBloc;

  @override
  _PartnersStructureRegisterBankWidget createState() =>
      _PartnersStructureRegisterBankWidget();
}
class _PartnersStructureRegisterBankWidget extends State<PartnersStructureRegisterBankWidget> {
  
  List<PartnerModel> partners = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Align(
      key: Key('Align-partner-structure'),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child:  Column(
          key: Key('column-partner-structure'),
          children: <Widget>[
            ...[
              Text(
                  I18n.of(context)
                      .bankRegisterAddPartnersTitle
                      .toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 10.18,
                  ))
            ],
            Expanded(
              key: Key('expanded-partner-structure'),
              child: Scrollbar(
                child: Padding(
                    padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 2),
                    child: _loadPartnersSelected(widget.gridViewWidth , partners , context),
                  ),
              ),
            ),
            ...[
              Padding(
                key: Key('padding-minimum-allowed'),
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 3),
                  child: PartnersAllowed()
              )
            ],
            ...[
              Container(
                margin:EdgeInsets.only(top: 20) ,
                child: ButtonLineRoundedWidget(
                  key: Key('add-partner-button'),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) 
                      => InviteModalRegisterBank(
                        partners: partners.length ,
                        partnerList: partners,
                        tokenUser: widget.tokenUser ,
                        menuNavigatorBloc: widget.menuNavigatorBloc,
                      )
                  ),
                  firstText:
                      I18n.of(context).bankRegisterAddPartnersButtonAdd,
                  secondText:
                      I18n.of(context).bankRegisterAddPartnersButtonPartner,
                ),
              )
            ]
          ],
        ),
      )
    );
  }

  void loadPartners(BuildContext context , String name , String phone) async {

    final partnerBody = {
      "name": name,
      "phone": name
    };    

    print('************* token *************');
    print(widget.tokenUser);

    final res = await postInvitePartner(widget.tokenUser, [partnerBody]);

    print(res);

    partners.add( PartnerModel(
      firstname: name,
      phone: phone
    ));

    Navigator.pop(context);
    //PartnerInitialize(token: widget.tokenUser);
    //widget.menuNavigatorBloc.add(ButtonPressed(goTo: HomeRoutesConstant.addPartnerScreen));

    setState(() {});
  }

Future<Map<String, dynamic>> postInvitePartner(
  String token, List<Map<String, dynamic>> partners) async {

  http.Client httpClient = http.Client();
  HttpRequests _httpRequest = HttpRequests();
  final postInvitePartner = ApiEndpoints.postInvitePartner();
  return await _httpRequest.post(
    httpClient: httpClient,
    url: postInvitePartner,
    token: token,
    body: {"partners": partners}
  );
}

Widget _loadPartnersSelected(
    double gridViewWidth,
    List<PartnerModel> partners,
    BuildContext context) {
  if ( partners.length > 0 ) {
    return GridView.builder(
      key: Key('gridview-partner-structure'),
      primary: false,
      padding: EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: gridViewWidth
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 0.0,
        crossAxisCount: 2,
        childAspectRatio: 1.3,
      ),
      itemCount: partners.length,
      itemBuilder: (context, index) {
        PartnerModel partner = partners[index];
        return PartnerCardWidget(
          name: partner.firstname,
          mobile: partner.phone,
          onDelete: () => {},
          //onSave: () => loadPartners(context ,partner.firstname, partner.phone ),
        );
      });
    } else {
      return Center(
          child: Text(
        I18n.of(context).bankRegisterAddPartnersNothing,
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.w100, color: Colors.white),
      ));
    }
  }
}

