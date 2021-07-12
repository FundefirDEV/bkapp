import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/partnersBloc/bloc/partner_bloc.dart';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/src/widgets/addPartners/widgets/partner_card_list.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../widgets.dart';

class PartnersStructureWidget extends StatefulWidget {
  const PartnersStructureWidget({
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
  _PartnersStructureWidgetState createState() =>
      _PartnersStructureWidgetState();
}
class _PartnersStructureWidgetState extends State<PartnersStructureWidget> {

  @override
  void initState() {
    context.read<PartnerBloc>().add(PartnerInitialize(token: widget.tokenUser));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocBuilder<PartnerBloc, PartnerState>(builder: (context, state){

      if (state is PartnerLoaded) {

        List<PartnerModel> _partnerList = state.partnerList;

        widget.guest ?
        _partnerList = state.partnerList.where((partner) => partner.role == 'guest').toList()
        :
        _partnerList = state.partnerList.where((partner) => partner.role == 'admin').toList();
        
        return PartnersCardList(partners: 
          _partnerList ,
          parnersQuantity: state.partnerList.length, 
          showButton: widget.guest, 
          tokenUser: widget.tokenUser,
          menuNavigatorBloc: widget.menuNavigatorBloc,
      );
      }
      if (state is PartnerFailure) {
        return ErrorPage(errorMessage: state.error);
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
