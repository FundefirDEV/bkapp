import 'package:bkapp_flutter/src/screens/home/widgets/optionsBk/options_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/home/widgets/tabInformationBk/tab_information_bk_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: AppBarWidget(container: _containerMyData(context))));
  }

  Widget _containerMyData(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TabInformationBkWidget(),
          lineSeparator(),
          OptionsBkWidget()
        ],
      ),
    );
  }

  Container lineSeparator() {
    return Container(
      key: Key('line-separator'),
      margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 2),
      height: 5.0,
      width: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
    );
  }
}
