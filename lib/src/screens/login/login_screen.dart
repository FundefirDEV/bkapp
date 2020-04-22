import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.data}) : super(key: key);

  final LoginScreenArgs data;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
           widget.data.title ?? 'No Hay titulo',
           style: TextStyle(
             fontSize: 40
           ),
          ),
          Text(
           widget.data.text ?? 'No Hay Texto',
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.w700
           ),
          ),
          RaisedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(I18n.of(context).loginScreenBack),
          )
        ],
      ),
    );
  }
}
class LoginScreenArgs {
  final String title;
  final String text;

  LoginScreenArgs(this.title, this.text);
}
