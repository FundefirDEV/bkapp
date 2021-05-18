import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/exemptions/widgets/exepmtions_button.dart';
import 'package:bkapp_flutter/src/screens/exemptions/widgets/partner_exemptions_list.dart';
import 'package:bkapp_flutter/src/screens/exemptions/widgets/total_interest_exemptions.dart';
import 'package:bkapp_flutter/src/screens/exemptions/widgets/total_pay_exemptions_list.dart';
import 'package:bkapp_flutter/src/utils/after_layaut.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter/material.dart';

class ExemptionsScreen extends StatefulWidget {
  ExemptionsScreen({Key key, this.oldIndex, this.userName, this.tokenUser})
      : super(key: key);

  final int oldIndex;
  final String userName;
  final String tokenUser;

  @override
  _ExemptionsScreenState createState() => _ExemptionsScreenState();
}

class _ExemptionsScreenState extends State<ExemptionsScreen>
    with AfterLayoutMixin<ExemptionsScreen> {
  @override
  void afterFirstLayout(BuildContext context) {
    _showDialog(context, context.read<MenuNavigatorBloc>(), widget.oldIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FormBlocListener<ExemptionsFormBloc, String, String>(
          onSubmitting: (context, state) {},
          onSuccess: (context, state) {},
          onFailure: (context, state) {},
          child: AppBarWidget(
              userName: widget.userName,
              container: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TitleHeaderWidget(
                      title: I18n.of(context).utilsExemptions,
                      showArrow: true,
                      oldIndex: widget.oldIndex,
                      menuNavigatorBloc: context.read<MenuNavigatorBloc>()),
                ),
                PartnerExemptionList(),
                LineSeparatorWidget(),
                TotalInterestExemptions(),
                TotalPayExemptions(),
                ExemptionsButton()
              ])));
    });
  }
}

void _showDialog(context, menuNavigatorBloc, oldIndex) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (_) {
        return ImageBottomModal(
            modalHeight: 45.0,
            image: 'assets/images/sad_bot.svg',
            isImageBg: false,
            title: I18n.of(context).modalTextsYourBkGroup,
            titleBold: I18n.of(context).modalTextsIsEnabled,
            isBold: true,
            isBtnAccept: false,
            titleCloseButton: I18n.of(context).administratorAssignmentClose,
            onPressCancel: () {
              menuNavigatorBloc.add(ButtonPressed(goTo: oldIndex));
              Navigator.pop(context);
            });
      });
}
