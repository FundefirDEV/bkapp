import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/introRegister/widgets/footer_intro.dart';
import 'package:bkapp_flutter/src/screens/introRegister/widgets/introCarousel/intro_carousel.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/header_content.dart';
import 'package:bkapp_flutter/src/widgets/bgOval/bg_oval.dart';
import 'package:bkapp_flutter/src/widgets/modals/bottomModal/bottom_modal.dart';
import 'package:bkapp_flutter/src/widgets/modals/bottomModal/register_modal.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
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
      // ItemCarousel(
      //     key: Key('itemCarousel-known-bk'),
      //     text1: I18n.of(context).introScreenHowDoesA,
      //     text2: I18n.of(context).introScreenQuestionGroupBk,
      //     image: 'assets/images/robot_read.svg',
      //     iconText: I18n.of(context).introScreenEducativeMedia,
      //     icon: 'assets/images/icon_media.svg',
      //     onPressed: () => Navigator.pushNamed(context, testRoute)),
      ItemCarousel(
          key: Key('itemCarousel-create-bk'),
          text1: I18n.of(context).introScreenRegister,
          text2: I18n.of(context).introScreenAccountBk,
          image: 'assets/images/robot_create.svg',
          iconText: I18n.of(context).introScreenGuidedForm,
          icon: 'assets/images/icon_form.svg',
          onPressed: () => _showDialog(context))
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
                  Container(
                      child: HeaderContent(
                    width: SizeConfig.safeBlockHorizontal * 80,
                    firstText: I18n.of(context).introScreenYouKnow,
                    firstFontWeight: FontWeight.w300,
                    secondText: I18n.of(context).introScreenGrupoBk,
                    subtitle: I18n.of(context).introScreenSelectOption,
                    subtitleWith: SizeConfig.safeBlockHorizontal * 50,
                    removePaddingTop: true
                  )),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      children: <Widget>[
                        for (var i = 0; i < characters.length; i++)
                          IntroCarousel(item: characters[i])
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 7),
                      child: FooterIntro()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDialog(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return BottomModal(
            width: SizeConfig.blockSizeHorizontal * 100,
            height: SizeConfig.blockSizeVertical * 45,
            child: RegisterModal(),
          );
        });
  }
}
