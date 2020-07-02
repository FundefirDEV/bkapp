import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final double viewportFraction;
  final List<Widget> children;
  final double heigthContainer;

  Carousel(
      {Key key, this.viewportFraction, this.children, this.heigthContainer})
      : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController pageController;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
        keepPage: false,
        initialPage: currentPage,
        viewportFraction: widget.viewportFraction);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('container-carousel'),
      height: widget.heigthContainer,
      child: PageView(
          key: Key('page-view-carousel'),
          controller: pageController,
          children: widget.children),
    );
  }
}
