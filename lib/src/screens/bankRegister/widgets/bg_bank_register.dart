import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class BgBankRegister extends StatelessWidget {
  final Widget child;
  const BgBankRegister({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      key: Key('material-bg-country'),
      child: Hero(
        tag: 'bg-next-register',
        child: Container(
          key: Key('container-bg-country'),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primaryColor[100],
                Theme.of(context).colorScheme.primaryColorDark
              ]
            )
          ),
          child: this.child,
        ),
      )
    );
  }
}
