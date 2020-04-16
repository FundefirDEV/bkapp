import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';

class HomeTestScreen extends StatefulWidget {
  HomeTestScreen({Key key, this.title, this.age}) : super(key: key);

  final String title;
  final int age;

  @override
  _HomeTestScreenState createState() => _HomeTestScreenState();
}

class _HomeTestScreenState extends State<HomeTestScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
