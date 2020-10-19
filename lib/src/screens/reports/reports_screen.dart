import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key key, @required this.userName}) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarWidget(
        userName: userName,
        container: Container(
          child: Column(
            children: [
              MultipleTabs(
                tabsText: ['ACCIONES', 'CRÉDITOS'],
                tabsContent: [
                  Center(child: Text('Acciones')),
                  Center(child: Text('Créditos'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
