import 'package:bkapp_flutter/src/screens/profileRegister/widgets/countryCarousel/country_carousel.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/header_select_country.dart';
import 'package:flutter/material.dart';

class CountryModalContentWidget extends StatelessWidget {
  CountryModalContentWidget({Key key, this.callback}) : super(key: key);
  
  final callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        key: Key('safearea-select-country'),
        child: Column(
          key: Key('column-select-country'),
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: HeaderCountry(),
            ),
            Expanded(
              key: Key('expanded-country-carousel'),
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: CountryCarousel(callback:callback)
              ),
            )
          ],
        ),
      ),
    );
  }
}