import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class InfoMainCard extends StatelessWidget {
  const InfoMainCard(
      {Key key,
      @required this.titleBlue,
      @required this.valueBlue,
      this.topTitle: 'Valor deuda',
      @required this.topValue,
      this.bottomTitle: 'Número de acciones',
      @required this.bottomValue})
      : super(key: key);

  final String valueBlue;
  final String titleBlue;
  final String topTitle;
  final String topValue;
  final String bottomTitle;
  final String bottomValue;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Column(
            children: [_profitInfo(context), _otherInfo(context)],
          ),
        ),
      ),
    );
  }

  Widget _profitInfo(BuildContext context) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 100,
      color: Theme.of(context).colorScheme.primaryColor[100],
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(valueBlue,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                  fontWeight: FontWeight.w100,
                  letterSpacing: 1)),
          SizedBox(height: 5),
          Text(
            titleBlue,
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.blockSizeHorizontal * 3.4,
                fontWeight: FontWeight.w700,
                letterSpacing: 3),
          )
        ],
      ),
    );
  }

  Widget _otherInfo(BuildContext context) {
    return Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 22.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _debtValue(context),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _shareNumbers(context),
              ),
            )
          ],
        ));
  }

  List<Widget> _debtValue(BuildContext context) {
    return [
      Text(
        topTitle,
        style: TextStyle(
            color: Theme.of(context).colorScheme.grayColor[300],
            fontSize: SizeConfig.blockSizeHorizontal * 3.8,
            fontWeight: FontWeight.w200),
      ),
      Text(
        topValue,
        style: TextStyle(
            color: Theme.of(context).colorScheme.grayColor[300],
            fontSize: SizeConfig.blockSizeHorizontal * 4.5,
            fontWeight: FontWeight.w100),
      )
    ];
  }

  List<Widget> _shareNumbers(BuildContext context) {
    return [
      Text(
        bottomTitle,
        style: TextStyle(
            color: Theme.of(context).colorScheme.grayColor[300],
            fontSize: SizeConfig.blockSizeHorizontal * 3.8,
            fontWeight: FontWeight.w200),
      ),
      Text(
        bottomValue,
        style: TextStyle(
            color: Theme.of(context).colorScheme.grayColor[300],
            fontSize: SizeConfig.blockSizeHorizontal * 4.5,
            fontWeight: FontWeight.w100),
      )
    ];
  }
}
