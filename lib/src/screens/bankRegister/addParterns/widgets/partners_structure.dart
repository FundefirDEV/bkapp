import 'package:bkapp_flutter/core/models/partner_model.dart';
import 'package:bkapp_flutter/core/services/sql/partner_sql.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/widgets.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/inviteModal/invite_modal.dart';

import 'widgets.dart';

class PartnersStructureWidget extends StatefulWidget {
  const PartnersStructureWidget({
    Key key,
    @required this.onSave
  }) : super(key: key);

  final Function onSave;

  @override
  _PartnersStructureWidgetState createState() => _PartnersStructureWidgetState();
}

class _PartnersStructureWidgetState extends State<PartnersStructureWidget> {
  List<PartnerModel> partners = List<PartnerModel>();
  PartnerDatabaseProvider partnerDb;

  @override
  void initState() {
    super.initState();
    partnerDb = PartnerDatabaseProvider.db;
    loadPartners();
  }

  void loadPartners() async {
    var getPartners = await partnerDb.getAllParters();

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

    return Align(
      key: Key('Align-partner-structure'),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: FutureBuilder<List<PartnerModel>>(
          future: partnerDb.getAllParters(),
          builder: (context, snapshot) {
            return Column(
              key: Key('column-partner-structure'),
              children: <Widget>[
                Text(I18n.of(context).bankRegisterAddPartnersTitle.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 10.18,
                  )
                ),
                Expanded(
                  key: Key('expanded-partner-structure'),
                  child: Scrollbar(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2
                      ),
                      child: _loadPartnersSelected(snapshot)
                    ),
                  ),
                ),
                Padding(
                  key: Key('padding-minimum-allowed'),
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 3
                  ),
                  child: PartnersAllowed()
                ),
                ButtonLineRoundedWidget(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => InviteModal(
                      onSave: () => loadPartners(),
                      partners: snapshot.hasData
                        ? snapshot.data.length
                        : 0
                    )
                  ),
                  firstText: I18n.of(context).bankRegisterAddPartnersButtonAdd,
                  secondText: I18n.of(context).bankRegisterAddPartnersButtonPartner,
                )
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _loadPartnersSelected(AsyncSnapshot<List<PartnerModel>> snapshot) {
    if (snapshot.hasData && partners.length > 0) {
      return GridView.builder(
        key: Key('gridview-partner-structure'),
        primary: false,
        padding: const EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: 25.0
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
        }
      );
    } else {
      return Center(
        child: Text(
          I18n.of(context).bankRegisterAddPartnersNothing,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w100,
            color: Colors.white
          ),
        )
      );
    }
  }
}
