import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bk_core/bk_core.dart' as core;
import 'items_country.dart';

class CountryCarousel extends StatefulWidget {
  CountryCarousel({Key key, this.callback}) : super(key: key);

  final callback;

  @override
  _CountryCarouselState createState() => _CountryCarouselState();
}

class _CountryCarouselState extends State<CountryCarousel> {
  PageController pageController;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
        keepPage: false, initialPage: currentPage, viewportFraction: 0.3);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PageView.builder(
      onPageChanged: (value) {
        setState(() {
          currentPage = value;
        });
      },
      controller: pageController,
      itemBuilder: (context, index) => animateItemBuilder(index),
    );
  }

  animateItemBuilder(int index) {
    List<ItemCountry> country = [
      ItemCountry(
          phoneCode: '+54',
          name: 'Argentina',
          image: 'assets/images/argentina.svg',
          iso: core.CountryCodes.ARGENTINA),
      ItemCountry(
          phoneCode: '+57',
          name: 'Colombia',
          image: 'assets/images/colombia.svg',
          iso: core.CountryCodes.COLOMBIA),
      ItemCountry(
          phoneCode: '+58',
          name: 'Venezuela',
          image: 'assets/images/venezuela.svg',
          iso: core.CountryCodes.VENEZUELA),
      ItemCountry(
          phoneCode: '+51',
          name: 'Perú',
          image: 'assets/images/peru.svg',
          iso: core.CountryCodes.PERU),
      ItemCountry(
          phoneCode: '+591',
          name: 'Bolivia',
          image: 'assets/images/bolivia.svg',
          iso: core.CountryCodes.BOLIVIA),
      ItemCountry(
          phoneCode: '+56',
          name: 'Chile',
          image: 'assets/images/chile.svg',
          iso: core.CountryCodes.CHILE),
      ItemCountry(
          phoneCode: '+221',
          name: 'Senegal',
          image: 'assets/images/senegal.svg',
          iso: core.CountryCodes.SENEGAL),
      ItemCountry(
          phoneCode: '+971',
          name: 'Emiratos',
          image: 'assets/images/emirates.svg',
          iso: core.CountryCodes.UNITED_ARAB_EMIRATES),
       ItemCountry(
          phoneCode: '+598',
          name: 'Uruguay',
          image: 'assets/images/uruguay.svg',
          iso: core.CountryCodes.URUGUAY),
        ItemCountry(
          phoneCode: '+1',
          name: 'Republica Dominicana',
          image: 'assets/images/republica-dominicana.svg',
          iso: core.CountryCodes.DOMINICAN_REPUBLIC),
        ItemCountry(
          phoneCode: '+66',
          name: 'Tailandia',
          image: 'assets/images/tailandia.svg',
          iso: core.CountryCodes.THAILAND),
        ItemCountry(
          phoneCode: '+234',
          name: 'Nigeria',
          image: 'assets/images/nigeria.svg',
          iso: core.CountryCodes.NIGERIA),
    ];

    double obtainValueOfCurve(PageController pageController) {
      double value = 1;
      if (pageController.position.haveDimensions) {
        value = pageController.page - index;
        return (1 - (value.abs() * 0.7)).clamp(0.0, 1.0);
      } else {
        return value;
      }
    }

    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = obtainValueOfCurve(pageController);
        return Center(
          key: Key('center-content-country-carousel'),
          child: Container(
            child: SizedBox(
              height: Curves.easeOut.transform(value) *
                  (SizeConfig.blockSizeVertical * 12),
              child: Container(child: child),
            ),
          ),
        );
      },
      child: Center(
        child: Stack(
          children: <Widget>[
            for (var i = 0; i < country.length; i++)
              if (index % country.length == i)
                Container(
                  color: Colors.transparent,
                  child: InkWell(
                    key: Key("country${i.toString()}"),
                    onTap: () {
                      widget.callback(country[i]);
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: SvgPicture.asset(
                        country[i].image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
