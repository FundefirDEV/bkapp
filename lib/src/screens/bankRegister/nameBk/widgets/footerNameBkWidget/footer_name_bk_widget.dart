import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/footerNameBkWidget/widgets/button_create_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/footerNameBkWidget/widgets/number_page_namebk_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class FooterNameBkWidget extends StatelessWidget {
  const FooterNameBkWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   SizeConfig().init(context);
    return Container(
      key: Key('footer-name-bk-container'),
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 6),
      child: Column(
        key: Key('column-footer-namebk'),
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ButtonCreateBkWidget(),
          NumberPageNameBkWidget()
        ],
      ),
    );
  }
}
