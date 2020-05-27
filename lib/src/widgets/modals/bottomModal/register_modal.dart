import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/bottomModal/widgets/image_register_type.dart';
import 'package:flutter/material.dart';

class RegisterModal extends StatelessWidget {
  const RegisterModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      child: Column(
        key: Key('column_register_modal'),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
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
              ),
            ),
          ),
          Expanded(child: ImageRegisterType()),
          Expanded(
            child: FlatButton(
                key: Key('register_button'),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  I18n.of(context).actionTextClose,
                  textAlign: TextAlign.center,
                  style: TextStyle(letterSpacing: 2.8),
                )),
          ),
        ],
      ),
    );
  }
}
