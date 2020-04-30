import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bk_core/bk_groups.dart';
// import 'package:bk_core/src/utils.dart';

class HomeTestScreen extends StatefulWidget {
  HomeTestScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeTestScreenState createState() => _HomeTestScreenState();
}

class _HomeTestScreenState extends State<HomeTestScreen> {
  Credit _credit;

  _createCredit() {
    var credit = Credit(
        amount: 3000,
        amountOfDues: 3,
        ordinaryInterestPercentaje: 3,
        typeOfInterestCalc: TypeOfInterestCalc.CLASSIC);

    setState(() {
      _credit = credit;
    });

    print('\n============== Classic =====================\n');
    print('List of capital Dues ${_credit.listOfCapitalDues}');
    print('List of ordinary interest');

    _credit.listOrdinaryInterest.forEach((interest) => print(
        '${interest.capitalDue} + ${interest.interestCalculate} = ${interest.total}'));
  }

  void _goToLogin() {
    Navigator.pushNamed(context, loginRoute);
  }

  void _goToIntro() {
    Navigator.pushNamed(
      context,
      introRoute
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
                              "Cantidad de cuotas: ${_credit?.amountOfDues?.toString() ?? 0}"),
                          Text("Monto: ${_credit?.amount?.toString() ?? 0}"),
                          Text(
                              "Interés ordinario: ${_credit?.ordinaryInterestPercentaje?.toString() ?? 0}"),
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
