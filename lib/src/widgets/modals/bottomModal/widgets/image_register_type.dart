import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageRegisterType extends StatelessWidget {
  const ImageRegisterType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: Key('row_register_modal'),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // FlatButton(
        //   key: Key('register_button1'),
        //   onPressed: () => {Navigator.pop(context)},
        //   child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: <Widget>[
        //         SvgPicture.asset('assets/images/google_logo.svg'),
        //         Text(I18n.of(context).introRegisterModalGmail,
        //             textAlign: TextAlign.justify)
        //       ]),
        // ),
        FlatButton(
          key: Key('register_button2'),
          onPressed: () => {_prevStepWidget(context)},
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SvgPicture.asset('assets/images/manRegisterModal.svg'),
                Text(I18n.of(context).introRegisterModalCustom,
                    textAlign: TextAlign.justify)
              ]),
        ),
      ],
    );
  }

  void _prevStepWidget(BuildContext context) {
    Navigator.pushNamed(context, genderRoute);
  }
}
