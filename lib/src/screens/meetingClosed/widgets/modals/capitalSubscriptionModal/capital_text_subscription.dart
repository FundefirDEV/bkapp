import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class CapitalTextSubscription extends StatelessWidget {
  const CapitalTextSubscription({Key key, @required this.totalCapital})
      : super(key: key);
  final String totalCapital;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'CAPITAL',
            style: TextStyle(
                fontSize: 12,
                letterSpacing: 2.13,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.grayColor[300]),
          ),
          SizedBox(height: 5),
          Text(
            totalCapital,
            style: TextStyle(
                fontSize: 21,
                color: Theme.of(context).colorScheme.grayColor[200]),
          ),
        ],
      ),
    );
  }
}
