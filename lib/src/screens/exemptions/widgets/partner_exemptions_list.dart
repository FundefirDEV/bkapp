import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class PartnerExemptionList extends StatelessWidget {
  const PartnerExemptionList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    ExemptionsFormBloc exemptionsBloc = context.bloc<ExemptionsFormBloc>();
    SizeConfig().init(context);
    return Container(
      height: 137,
      width: SizeConfig.blockSizeHorizontal * 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color(0x11000000),
              offset: Offset(0, 2),
              blurRadius: 12,
              spreadRadius: 0)
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 65,
            width: SizeConfig.blockSizeHorizontal * 75,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryColor[100],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(r'$0', style: TextStyle(fontSize: 21, color: Colors.white)),
              Text(
                I18n.of(context).exemptionsCreditRequest,
                style: TextStyle(color: Colors.white),
              ),
            ]),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              textTheme: Theme.of(context).textTheme.copyWith(
                    subtitle1: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).colorScheme.grayColor[400],
                        fontSize: SizeConfig.blockSizeHorizontal * 5,
                        fontWeight: FontWeight.w100),
                  ),
            ),
            child: DropdownFieldBlocBuilder<String>(
              showEmptyItem: false,
              padding: EdgeInsets.only(top: 0, left: 15),
              selectFieldBloc: exemptionsBloc.selectPartnerExemption,
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.grayColor[400],
                labelText: I18n.of(context).exemptionsSelectPartner,
                labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor[400]),
                border: InputBorder.none,
                suffixIcon: Icon(Icons.keyboard_arrow_down,
                    color: Theme.of(context).colorScheme.primaryColor[100]),
              ),
              itemBuilder: (context, value) => value,
            ),
          ),
        ],
      ),
    );
  }
}
