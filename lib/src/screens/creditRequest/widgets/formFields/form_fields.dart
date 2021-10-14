import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class FormFields extends StatelessWidget {
  const FormFields({Key key, this.creditFormBloc}) : super(key: key);

  final CreditFormBloc creditFormBloc;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    initItems(context);
    
    return Container(
      key: Key('credit-form-container'),
      width: SizeConfig.blockSizeHorizontal * 70,
      child: Column(
        children: <Widget>[
          TextFieldBlocBuilder(
            key: Key('credit-form-request-value'),
            textFieldBloc: creditFormBloc.valueCredit,
            errorBuilder: (context, string) => I18n.of(context).errorRequired,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                labelText: I18n.of(context).creditScreenValueToRequest,
                labelStyle:
                    TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
                suffixIcon: Icon(Icons.attach_money)),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter()
            ],
          ),
          TextFieldBlocBuilder(
              key: Key('buy-shares-form-numberactiosdsns'),
              textFieldBloc: creditFormBloc.installments,
              errorBuilder: (context, string) => I18n.of(context).errorRequired,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  labelText: I18n.of(context).creditScreenNumberOfFees,
                  labelStyle:
                      TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
                  suffixIcon: Icon(Icons.filter_3))),
          DropdownFieldBlocBuilder<String>(
              key: Key('list-state-kgh'),
              showEmptyItem: false,
              selectFieldBloc: creditFormBloc.creditUse,
              decoration: InputDecoration(
                labelText: I18n.of(context).creditScreenUseOfCredit,
                suffixIcon: Icon(Icons.keyboard_arrow_down),
              ),
              itemBuilder: (context, value) => value),
          DropdownFieldBlocBuilder<String>(
              key: Key('list-detail-credit'),
              showEmptyItem: false,
              selectFieldBloc: creditFormBloc.creditDetail,
              decoration: InputDecoration(
                labelText: I18n.of(context).creditScreenDetail,
                suffixIcon: Icon(Icons.keyboard_arrow_down),
              ),
              itemBuilder: (context, value) => value)
        ],
      ),
    );
  }

  void initItems(BuildContext context) {
    creditFormBloc.creditItems = [
      I18n.of(context).creditScreenItemsCreditUseGenerationincome,
      I18n.of(context).creditScreenItemsCreditUseFamilystrengthening,
      I18n.of(context).creditScreenItemsCreditUseConsumption,
    ];
    
    creditFormBloc.useCreditOption0 = [
      I18n.of(context).creditScreenUseCreditOption0Smallcompany,
      I18n.of(context).creditScreenUseCreditOption0Trade,
    ];
    
    creditFormBloc.useCreditOption1 = [
      I18n.of(context).creditScreenUseCreditOption1HousingImprovement,
      I18n.of(context).creditScreenUseCreditOption1HouseholdEquipment,
      I18n.of(context).creditScreenUseCreditOption1Education,
      I18n.of(context).creditScreenUseCreditOption1Health,
    ];
    
    creditFormBloc.useCreditOption2 = [
      I18n.of(context).creditScreenUseCreditOption2Debtpayment,
      I18n.of(context).creditScreenUseCreditOption2FoodAndClothing,
      I18n.of(context).creditScreenUseCreditOption2Recreation,
      I18n.of(context).creditScreenUseCreditOption2ServicesPay,
      I18n.of(context).creditScreenUseCreditOption2Transport,
      I18n.of(context).creditScreenUseCreditOption2Travels,
    ];
    
    creditFormBloc.creditUse.updateItems(creditFormBloc.creditItems);
    
  }
}
