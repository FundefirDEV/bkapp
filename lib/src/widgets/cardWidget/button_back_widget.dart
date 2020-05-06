import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonBackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.safeBlockVertical * 2,
            horizontal: SizeConfig.safeBlockHorizontal * 6),
        child: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.grayColor[200],
          onPressed: () => Navigator.pop(context),
        ));
  }
}
