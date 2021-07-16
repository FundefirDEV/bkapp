import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/core/models/partner_model.dart';
import 'package:bkapp_flutter/core/services/api/http_requests.dart';
import 'package:bkapp_flutter/environment_config.dart';
import 'package:bkapp_flutter/src/widgets/addPartners/widgets/partner_card_widget.dart';
import 'package:bkapp_flutter/src/widgets/addPartners/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/widgets.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/inviteModal/invite_modal.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/app_bloc.dart';


// ignore: must_be_immutable
class PartnersCardList extends StatefulWidget {
  PartnersCardList({ 
    Key key, this.showButton , this.partnersList , this.parnersQuantity, 
    @required this.tokenUser , @required this.menuNavigatorBloc
  }) : super(key: key);

  List<PartnerModel> partnersList  = [];
  bool showButton = false;
  final tokenUser;
  final int parnersQuantity;
  final MenuNavigatorBloc menuNavigatorBloc;

  @override
  _PartnersCardListState createState() =>
      _PartnersCardListState(partnersList: partnersList , showButton: showButton);
}

class _PartnersCardListState extends State<PartnersCardList> {

  _PartnersCardListState({this.partnersList , this.showButton});

  List<PartnerModel> partnersList = [];
  bool showButton = false;

  final gridViewWidth = 15.0;

  @override
  void initState() {
    super.initState();
    partnersList = context.read<AppBloc>().bankRegisterBloc.partnerList;

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
                    child: _loadPartnersSelected(gridViewWidth , partnersList , context),
                  ),
              ),
            ),
            if (widget.showButton)...[
              Container(
                margin:EdgeInsets.only(top: 20) ,
                child: ButtonLineRoundedWidget(
                  key: Key('add-partner-button'),
                  color: Colors.blue,
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) 
                      => InviteModal(
                        partners:widget.parnersQuantity ,
                        partnerList: partnersList,
                        tokenUser: widget.tokenUser ,
                        menuNavigatorBloc: widget.menuNavigatorBloc,
                        addPartner: _addPartnerForm ,
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


  void _addPartnerForm(List<PartnerModel> partner){
    partnersList.addAll(partner);

    context.read<AppBloc>().bankRegisterBloc.partnerList = partnersList;
    
    setState(() {});
  }
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


  

