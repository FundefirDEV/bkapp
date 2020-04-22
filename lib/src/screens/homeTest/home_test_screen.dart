import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';

class HomeTestScreen extends StatefulWidget {
  HomeTestScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeTestScreenState createState() => _HomeTestScreenState();
}

class _HomeTestScreenState extends State<HomeTestScreen> {

  void _goToLogin() {
    Navigator.pushNamed(
      context,
      loginRoute,
      arguments: LoginScreenArgs(
        I18n.of(context).loginScreenTitle,
        I18n.of(context).loginScreenText
      )
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              I18n.of(context).firstText,
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 5,
                fontWeight: FontWeight.w100
              ),
            ),
            Card(
              elevation: 20.0,
              child: InkWell(
                onTap: () => print('jeje'),
                child: Container(
                  width: SizeConfig.safeBlockHorizontal * 50,
                  height: SizeConfig.safeBlockVertical * 20,
                  child: Text('Hola Mundo'),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: RaisedButton(
        onPressed: _goToLogin,
        child: Text(I18n.of(context).goToLogin),
        color: Colors.blueAccent,
        textColor: Colors.white,
      )
    );
  }
}
