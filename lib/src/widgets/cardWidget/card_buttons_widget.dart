import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';

// import 'package:bkapp_flutter/core/bloc/loginFormBloc/login_form_bloc.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
class CardButtonsWidget extends StatelessWidget {
  final Widget child;
  final Function accept;
  final String acceptText;
  final Function cancel;
  final String cancelText;
  final bool loading;

  const CardButtonsWidget({
    Key key,
    @required this.accept,
    @required this.child,
    this.cancel,
    this.acceptText,
    this.cancelText,
    @required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // final loginBloc = context.watch<LoginFormBloc>();

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
                      child: !loading ? 
                       loginLoadingText(context) :
                       loginText(context),
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
  Widget loginLoadingText(BuildContext context){
    return Container(
      width: SizeConfig.safeBlockHorizontal * 55,
      height: SizeConfig.safeBlockVertical * 3.5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.acceptText ?? I18n.of(context).actionTextWait,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 4,
              color: Colors.white,
              letterSpacing: 3.0,
            ),
          ),
          Container(
            // width: SizeConfig.safeBlockHorizontal * 7.5,
            // height: SizeConfig.safeBlockVertical * 3.5,
            height: 18,
            width: 18,
            margin: EdgeInsets.only(left: 15) ,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
    
  Widget loginText(BuildContext context){
    return Container(
      width: SizeConfig.safeBlockHorizontal * 55,
      height: SizeConfig.safeBlockVertical * 3.5,
      alignment: Alignment.center  ,
      child: Text(
        this.acceptText ?? I18n.of(context).actionTextEnter,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 4,
          color: Colors.white,
          letterSpacing: 3.0,
        ),
      ),
    );
  }
}
