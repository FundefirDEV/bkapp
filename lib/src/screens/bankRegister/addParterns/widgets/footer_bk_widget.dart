import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/number_step_bk_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class FooterBkWidget extends StatelessWidget {
  const FooterBkWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   SizeConfig().init(context);
    return Container(
      key: Key('footer-partner-bk-container'),
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 6),
      child: Column(
        key: Key('column-footer-partnerbk'),
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          NumberStepBkWidget(
            currentIndex: 2,
            itemsLength: 3,
            prevRoute: () =>
              Navigator.pushNamed(context, selectAddressRoute),
            nextRoute: () =>
              Navigator.pushNamed(context, nameBkRoute),
          )
        ],
      ),
    );
  }
}
