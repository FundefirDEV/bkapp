import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class CardButtonsWidget extends StatelessWidget {
  final Widget child;
  final Function accept;
  final String acceptText;
  final Function cancel;
  final String cancelText;

  const CardButtonsWidget({
    Key key,
    @required this.accept,
    @required this.child,
    this.cancel,
    this.acceptText,
    this.cancelText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 2,
          horizontal: SizeConfig.safeBlockHorizontal * 6
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              this.child,
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      key: Key('raisedButton-accept'),
                      onPressed: this.accept,
                      color: Theme.of(context).colorScheme.primaryColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 12.0
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Text(
                        this.acceptText ?? I18n.of(context).actionTextEnter,
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                          color: Colors.white,
                          letterSpacing: 3.0,
                        ),
                      ),
                    ),
                    if (this.cancel != null) ...[
                      FlatButton(
                        key: Key('flatButton-cancel'),
                        onPressed: this.cancel,
                        child: Text(
                          this.cancelText ?? I18n.of(context).actionTextImNew,
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                            color: Theme.of(context).colorScheme.grayColor,
                            letterSpacing: 2.0
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
