import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'items_country.dart';

class CountryCarousel extends StatefulWidget {
  CountryCarousel({Key key}) : super(key: key);

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
      keepPage: false,
      initialPage: currentPage,
      viewportFraction: 0.3
    );
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
          image: 'assets/images/argentina.svg'
      ),
      ItemCountry(
          image: 'assets/images/colombia.svg'
      ),
      ItemCountry(
          image: 'assets/images/peru.svg'
      )
    ];

    double obtainValueOfCurve(PageController pageController)
    {
      double value = 1;
      if(pageController.position.haveDimensions){
        value = pageController.page - index;
        return (1 - (value.abs() * 0.7)).clamp(0.0, 1.0);
      } else{
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
              height: Curves.easeOut.transform(value) * (SizeConfig.blockSizeVertical * 12),
              child: Container(
                child: child
              ),
            ),
          ),
        );
      },
      child: Center(
        child: Stack(
          children: <Widget>[
            for (var i = 0; i < country.length; i++)
              if (index % 3 == i)
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: Container(
                      child: SvgPicture.asset(
                        country[i].image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
