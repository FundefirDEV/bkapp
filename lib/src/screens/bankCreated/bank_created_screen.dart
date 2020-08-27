import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:bkapp_flutter/core/services/sql/sqflite.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_next_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BankCreatedScreen extends StatelessWidget {
  final BankCreatedScreenArgs data;
  const BankCreatedScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PartnerDatabaseProvider partnerDb = PartnerDatabaseProvider.db;
    ActivePartnersDbProvider activePartnersDb = ActivePartnersDbProvider.db;
    return Material(
        child: SafeArea(
            child: Column(
      key: Key('column_bank_created_screen'),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Center(child: _buildText(context, data.bankName)),
        FadeInUp(
          child: Center(
              key: Key('svgPicture_bank_created'),
              child: SvgPicture.asset('assets/images/bank_created.svg')),
        ),
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            ButtonNextWidget(
                onTap: () async {
                  await partnerDb.deleteAllPartners();
                  await activePartnersDb.deleteAllPartners();
                  _clearInputs(context);
                  Navigator.pushNamed(context, loginRoute);
                }
            ),
          ]),
        )
      ],
    )));
  }

  Widget _buildText(context, String bkName) {
    SizeConfig().init(context);
    return RichText(
      key: Key('richText_bank_created_screen'),
      textAlign: TextAlign.center,
      text: TextSpan(
          text: I18n.of(context).bankCreatedScreenVery,
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 5,
            fontWeight: FontWeight.w400,
            letterSpacing: 2.0,
            color: Colors.grey,
          ),
          children: <TextSpan>[
            TextSpan(
              text: I18n.of(context).bankCreatedScreenGood + '\n',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
              text: bkName,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
              text: I18n.of(context).bankCreatedScreenHasBeenCreaed,
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            )
          ]),
    );
  }

  void _clearInputs(BuildContext context) {
    context.bloc<AppBloc>().profileRegisterBloc.nameBloc.clear();
    context.bloc<AppBloc>().profileRegisterBloc.emailBloc.clear();
    context.bloc<AppBloc>().profileRegisterBloc.phoneBloc.clear();
    context.bloc<AppBloc>().profileRegisterBloc.password.clear();
    context.bloc<AppBloc>().profileRegisterBloc.passwordConfirm.clear();
  }
}

class BankCreatedScreenArgs {
  final String bankName;

  BankCreatedScreenArgs(this.bankName);
}
