import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/generated/i18n.dart';

class DoubleCardsInfo extends StatelessWidget {
  const DoubleCardsInfo(
      {Key key,
      @required this.totalSustainability,
      @required this.totalReserve})
      : super(key: key);

  final String totalSustainability;
  final String totalReserve;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _cardInfo(
                context,
                I18n.of(context).reportsScreenSustainability,
                totalSustainability),
          ),
          SizedBox(
            height: 20.0,
            width: 20.0,
          ),
          Expanded(
              child: _cardInfo(
                  context, I18n.of(context).reportsScreenReserve, totalReserve))
        ],
      ),
    );
  }

  Widget _cardInfo(
      BuildContext context, String title, String totalSustainability) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.grayColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700)),
          SizedBox(height: 15.0),
          Text(totalSustainability)
        ],
      ),
    );
  }
}
