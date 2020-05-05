import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class RegisterModal extends StatelessWidget {
  const RegisterModal({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      key: Key('column_register_modal'),
      mainAxisAlignment: MainAxisAlignment.spaceAround, 
      children: <Widget>[
        Container(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: I18n.of(context).introRegisterModalTitle + '\n',
                  style: TextStyle(
                    color: Color(0xFF5c5c5c),
                    fontSize: SizeConfig.blockSizeHorizontal * 6,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                TextSpan(
                  text: I18n.of(context).introRegisterModalCreateAccount,
                  style: TextStyle(
                    color: Color(0xFF5c5c5c),
                    fontSize: SizeConfig.blockSizeHorizontal * 6,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: I18n.of(context).introRegisterModalInterrogation,
                  style: TextStyle(
                    color: Color(0xFF5c5c5c),
                    fontSize: SizeConfig.blockSizeHorizontal * 6,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          textAlign: TextAlign.center,
          ),
        ),
        Row(
          key: Key('row_register_modal'),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                  FlatButton(
                  key: Key('register_button'),
                  shape: new RoundedRectangleBorder
                  (borderRadius: new BorderRadius.circular(100.0)),
                  onPressed: () => {},
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                    children: <Widget>[
                      SvgPicture.asset('assets/images/google_logo.svg'),
                      Text
                      (I18n.of(context).introRegisterModalGmail,
                      textAlign: TextAlign.justify)
                    ]
                  ),
                 ),
              ],
            ),
            Column(
              children: <Widget>[
                 FlatButton(
                  key: Key('register_button'),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(100.0)),
                  onPressed: () => {},
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SvgPicture.asset('assets/images/manRegisterModal.svg'),
                      Text(I18n.of(context).
                      introRegisterModalCustom, textAlign: TextAlign.justify)
                    ]
                  ),
                 ),
              ],
            ),
          ],
        ),
        FlatButton(
          key: Key('register_button'),
          onPressed:() => Navigator.pop(context),
          padding: EdgeInsets.all(0.0),
          child:
          Text(
            I18n.of(context).actionTextClose,
            textAlign: TextAlign.center
          )
        ),
      ],
    );
    }
}
