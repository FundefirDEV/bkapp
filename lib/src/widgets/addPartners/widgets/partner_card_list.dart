import 'package:bkapp_flutter/core/models/partner_model.dart';
import 'package:bkapp_flutter/src/widgets/addPartners/widgets/partner_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/widgets.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/inviteModal/invite_modal.dart';


// ignore: must_be_immutable
class PartnersCardList extends StatefulWidget {
  PartnersCardList({ 
    Key key, this.showButton , this.partners , 
    @required this.tokenUser 
  }) : super(key: key);

  List<PartnerModel> partners  = [];
  bool showButton = false;
  final tokenUser;

  @override
  _PartnersCardListState createState() =>
      _PartnersCardListState(partners: partners , showButton: showButton);
}

class _PartnersCardListState extends State<PartnersCardList> {

  _PartnersCardListState({this.partners , this.showButton});

  List<PartnerModel> partners = [];
  bool showButton = false;

  final gridViewWidth = 15.0;

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
                    child: _loadPartnersSelected(gridViewWidth , partners , context),
                  ),
              ),
            ),
            ...[
              Padding(
                key: Key('padding-minimum-allowed'),
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 3),
                 //child: PartnersAllowed()
              )
            ],
            if (widget.showButton)...[
              ButtonLineRoundedWidget(
                
                key: Key('add-partner-button'),
                //color: widget.colorButton,
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) 
                    => InviteModal(
                      partners:partners.length ,
                      partnerList: partners,
                      tokenUser: widget.tokenUser ,
                    )
                    //value: BlocProvider.of<PartnerBloc>(context),
                    // child: InviteModal(
                    //     //tokenUser: widget.tokenUser
                    // ),
                ),
                firstText:
                    I18n.of(context).bankRegisterAddPartnersButtonAdd,
                secondText:
                    I18n.of(context).bankRegisterAddPartnersButtonPartner,
              )
            ]
          ],
        ),
      )
    );
  }
}

Widget _loadPartnersSelected(
    double gridViewWidth,
    List<PartnerModel> partners,
    BuildContext context
  ) {
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
              //onSave: () => loadPartners(),
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

