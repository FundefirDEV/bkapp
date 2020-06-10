import 'package:flutter/material.dart';

class LoadingIndicatorScreen extends StatelessWidget {
  const LoadingIndicatorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
    child: CircularProgressIndicator(),
  );
}
