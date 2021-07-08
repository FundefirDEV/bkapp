import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/partnersBloc/bloc/partner_bloc.dart';
import 'package:bkapp_flutter/src/widgets/addPartners/widgets/partner_card_list.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../widgets.dart';

class PartnersStructureWidget extends StatefulWidget {
  const PartnersStructureWidget({
    Key key,
    this.colorButton: Colors.transparent,
    this.tokenUser,
    this.gridViewWidth = 25.0,
  }) : super(key: key);

  final Color colorButton;
  final String tokenUser;
  final double gridViewWidth;

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
        return PartnersCardList(partners: 
          state.partnerList , 
          showButton: true, 
          tokenUser: widget.tokenUser,
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
