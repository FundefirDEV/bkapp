import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/exemptions/widgets/exepmtions_button.dart';
import 'package:bkapp_flutter/src/screens/exemptions/widgets/partner_exemptions_list.dart';
import 'package:bkapp_flutter/src/screens/exemptions/widgets/total_interest_exemptions.dart';
import 'package:bkapp_flutter/src/screens/exemptions/widgets/total_pay_exemptions_list.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter/material.dart';

class ExemptionsSreen extends StatefulWidget {
  ExemptionsSreen({Key key, this.oldIndex, this.userName, this.tokenUser})
      : super(key: key);

  final int oldIndex;
  final String userName;
  final String tokenUser;

  @override
  _ExemptionsSreenState createState() => _ExemptionsSreenState();
}

class _ExemptionsSreenState extends State<ExemptionsSreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    MenuNavigatorBloc menuNavigatorBloc = context.bloc<MenuNavigatorBloc>();
    return Builder(
      builder: (context) {
        return FormBlocListener<ExemptionsFormBloc, String, String>(
          onSubmitting: (context, state) {},
          onSuccess: (context, state) {},
          onFailure: (context, state) {},
          child: AppBarWidget(
            userName: widget.userName,
            container: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TitleHeaderWidget(
                    title: I18n.of(context).utilsExemptions,
                    showArrow: true,
                    oldIndex: widget.oldIndex,
                    navigateBloc: menuNavigatorBloc,
                  ),
                ),
                PartnerExemptionList(),
                LineSeparatorWidget(),
                TotalInterestExemptions(),
                TotalPayExemptions(),
                ExemptionsButton()
              ],
            ),
          ),
        );
      },
    );
  }
}
