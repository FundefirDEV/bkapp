import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class InfiniteCarousel extends StatefulWidget {
  InfiniteCarousel(
      {Key key,
      this.children,
      this.alignment,
      this.heigthContainer,
      this.viewportFraction})
      : super(key: key);

  final List<Widget> children;
  final Alignment alignment;
  final double heigthContainer;
  final double viewportFraction;

  @override
  _InfiniteCarouselState createState() => _InfiniteCarouselState();
}

class _InfiniteCarouselState extends State<InfiniteCarousel> {
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
      key: Key('container-infinite-carousel'),
      height: widget.heigthContainer,
      child: PageView.builder(
        key: Key('container-pageview-carousel'),
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        controller: pageController,
        itemBuilder: (context, index) => animateItemBuilder(index),
      ),
    );
  }

  animateItemBuilder(int index) {
    return AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          return Stack(
            key: Key('stack-infinite-carousel'),
            alignment: widget.alignment,
            children: <Widget>[
              for (var i = 0; i < widget.children.length; i++)
                if (index % widget.children.length == i) widget.children[i]
            ],
          );
        });
  }
}
