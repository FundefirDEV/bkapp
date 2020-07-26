import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final double viewportFraction;
  final List<Widget> children;
  final double heigthContainer;
  final int currentPage;

  Carousel(
      {Key key,
      this.viewportFraction = 0.3,
      this.children,
      this.currentPage = 1,
      this.heigthContainer = 200})
      : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
        keepPage: false,
        initialPage: widget.currentPage,
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
