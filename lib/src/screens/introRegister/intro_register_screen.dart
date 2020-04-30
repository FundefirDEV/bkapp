import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/introRegister/widgets/footer_intro.dart';
import 'package:bkapp_flutter/src/screens/introRegister/widgets/title_intro.dart';
import 'package:bkapp_flutter/src/widgets/bgOval/bg_oval.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel.dart';
import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import 'items_carousel.dart';

class IntroRegisterScreen extends StatefulWidget {
  IntroRegisterScreen({Key key}) : super(key: key);

  @override
  _IntroRegisterScreenState createState() => _IntroRegisterScreenState();
}

class _IntroRegisterScreenState extends State<IntroRegisterScreen> {
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 0.6, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<ItemCarousel> characters = [
      ItemCarousel(
          text1: I18n.of(context).introScreenHowDoesA,
          text2: I18n.of(context).introScreenQuestionGroupBk,
          image: 'assets/images/robot_read.svg',
          iconText: I18n.of(context).introScreenEducativeMedia,
          icon: 'assets/images/icon_media.svg'),
      ItemCarousel(
          text1: I18n.of(context).introScreenRegister,
          text2: I18n.of(context).introScreenAccountBk,
          image: 'assets/images/robot_create.svg',
          iconText: I18n.of(context).introScreenGuidedForm,
          icon: 'assets/images/icon_form.svg'),
    ];

    return Material(
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Positioned(bottom: 0, child: BgOval()),
            SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(child: TitleIntro()),
                  ),
                  Expanded(
                    flex: 2,
                    child: PageView(
                      controller: _pageController,
                      children: <Widget>[
                        for (var i = 0; i < characters.length; i++)
                          Carousel(item: characters[i])
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: Container(child: FooterIntro())),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
