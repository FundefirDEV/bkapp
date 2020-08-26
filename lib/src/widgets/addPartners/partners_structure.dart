import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/partnersBloc/bloc/partner_bloc.dart';
import 'package:bkapp_flutter/core/models/partner_model.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/widgets.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/inviteModal/invite_modal.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import './widgets/widgets.dart';

class PartnersStructureWidget extends StatefulWidget {
  const PartnersStructureWidget({
    Key key,
    @required this.onSave,
    this.isRegister: true,
    this.colorButton: Colors.transparent,
    this.showButton: true,
    this.tokenUser,
    @required this.partnerDb,
    this.gridViewWidth = 25.0
  }) : super(key: key);

  final Function onSave;
  final bool isRegister;
  final Color colorButton;
  final bool showButton;
  final String tokenUser;
  final dynamic partnerDb;
  final double gridViewWidth;

  @override
  _PartnersStructureWidgetState createState() =>
      _PartnersStructureWidgetState();
}

class _PartnersStructureWidgetState extends State<PartnersStructureWidget> {
  List<PartnerModel> partners = List<PartnerModel>();

  @override
  void initState() {
    super.initState();
    loadPartners();
  }

  void loadPartners() async {
    var getPartners = await widget.partnerDb.getAllParters();

    if (widget.onSave != null) widget.onSave(getPartners);
    if (getPartners.length > 0) {
      getPartners.forEach((partner) {
        setState(() => partners.add(partner));
      });
    } else {
      setState(() => partners = []);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocProvider<PartnerBloc>(
      create: (context) => PartnerBloc(partnerRepository: partnerRepository),
      child: BlocListener<PartnerBloc, PartnerState>(
        listener: (context, state) {
          if (state is PartnerUnauthorized) {
            UtilsTools.showErrorDialog(context, state.error);
          }
          if (state is PartnerAddedToDb) {
            loadPartners();
          }
        },
        child: Builder(
          builder: (contextA) {
            return Align(
              key: Key('Align-partner-structure'),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: FutureBuilder<List<PartnerModel>>(
                    future: widget.partnerDb.getAllParters(),
                    builder: (context, snapshot) {
                      return Column(
                        key: Key('column-partner-structure'),
                        children: <Widget>[
                          if (widget.isRegister) ...[
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
                                  child: _loadPartnersSelected(
                                    snapshot,
                                    widget.gridViewWidth
                                  )),
                            ),
                          ),
                          if (widget.isRegister) ...[
                            Padding(
                                key: Key('padding-minimum-allowed'),
                                padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.blockSizeVertical * 3),
                                child: PartnersAllowed())
                          ],
                          if (widget.showButton) ...[
                            ButtonLineRoundedWidget(
                              color: widget.colorButton,
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => BlocProvider.value(
                                  value: BlocProvider.of<PartnerBloc>(contextA),
                                  child: InviteModal(
                                      partners:
                                        snapshot.hasData ? snapshot.data.length : 0,
                                      isRegister: widget.isRegister,
                                      tokenUser: widget.tokenUser
                                  ),
                                )
                              ),
                              firstText:
                                  I18n.of(context).bankRegisterAddPartnersButtonAdd,
                              secondText:
                                  I18n.of(context).bankRegisterAddPartnersButtonPartner,
                            )
                          ]
                        ],
                      );
                    }),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _loadPartnersSelected(
    AsyncSnapshot<List<PartnerModel>> snapshot,
    double gridViewWidth
  ) {
    if (snapshot.hasData && partners.length > 0) {
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
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            PartnerModel partner = snapshot.data[index];
            return PartnerCardWidget(
              id: partner.id,
              name: partner.firstname,
              mobile: partner.phone,
              onSave: () => loadPartners(),
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
