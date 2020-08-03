import 'dart:ui';
import 'package:bkapp_flutter/core/bloc/loginFormBloc/authentication/authentication_bloc.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/widgets/modals/preApprovedRequest/pre_approved_credit_modal.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bk_core/bk_core.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class HomeTestScreen extends StatefulWidget {
  HomeTestScreen({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _HomeTestScreenState createState() => _HomeTestScreenState();
}

class _HomeTestScreenState extends State<HomeTestScreen> {
  Credit _credit;

  _createCredit() {
    var credit = Credit(
        creditAmount: 3000,
        installments: 3,
        ordinaryInterestPercentaje: 3,
        typeOfInterestCalc: TypeOfInterestCalc.CLASSIC,
        defaultInterestPercentaje: 3);

    setState(() {
      _credit = credit;
    });

    print('\n============== Classic =====================\n');
    print('List of capital Dues ${_credit.listOfInstallments}');
    print('List of ordinary interest');

    _credit.scheduleInstallments.forEach((interest) => print(
        '${interest.capitalInstallment} + ${interest.interestCalculate} = ${interest.totalPayInstallment}'));
  }

  void _goToIntro() {
    Navigator.pushNamed(context, selectAddressRoute);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () => BlocProvider.of<AuthenticationBloc>(context)
                    .add(LoggedOut()))
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  I18n.of(context).firstText,
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                      fontWeight: FontWeight.w100),
                ),
                Card(
                  elevation: 20.0,
                  child: InkWell(
                    onTap: () => print('jeje'),
                    child: Container(
                      width: SizeConfig.safeBlockHorizontal * 50,
                      height: SizeConfig.safeBlockVertical * 20,
                      child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                          Text('Hola Mundo'),
                          Text(
                              "Cantidad de cuotas: ${_credit?.installments?.toString() ?? 0}"),
                          Text(
                              "Monto: ${_credit?.creditAmount?.toString() ?? 0}"),
                          Text(
                              "Interés ordinario: ${_credit?.ordinaryInterestPercentaje?.toString() ?? 0}"),
                          RaisedButton(
                            onPressed: () => showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) =>
                                    PreApprovedCreditModal()),
                            color: Colors.red,
                            child: Text('Invite Modal',
                                style: TextStyle(fontSize: 20)),
                          ),
                          RaisedButton(
                            onPressed: _createCredit,
                            color: Colors.amber,
                            child: Text('Create credit',
                                style: TextStyle(fontSize: 20)),
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: RaisedButton(
          onPressed: _goToIntro,
          child: Text(I18n.of(context).goToLogin),
          color: Colors.blueAccent,
          textColor: Colors.white,
        ));
  }
}
