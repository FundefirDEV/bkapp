import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:bkapp_flutter/core/services/sql/sqflite.dart';
import 'package:bkapp_flutter/environment_config.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/login/widgets/change_pass_widget.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/login/widgets/login_form_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_version/get_version.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Offset position = Offset(20.0, 20.0);
  String _platformVersion = 'Unknown';
  String _projectVersion = '';
  String _projectCode = '';
  // ignore: unused_field
  String _projectAppID = '';
  // ignore: unused_field
  String _projectName = '';

  PartnerDatabaseProvider partnerDb = PartnerDatabaseProvider.db;
  ActivePartnersDbProvider activePartnersDb = ActivePartnersDbProvider.db;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _deleteDataBase();
  }

  Future<void> initPlatformState() async {
        String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GetVersion.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    String projectVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectVersion = await GetVersion.projectVersion;
    } on PlatformException {
      projectVersion = 'Failed to get project version.';
    }

    String projectCode;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectCode = await GetVersion.projectCode;
    } on PlatformException {
      projectCode = 'Failed to get build number.';
    }

    String projectAppID;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectAppID = await GetVersion.appID;
    } on PlatformException {
      projectAppID = 'Failed to get app ID.';
    }

    String projectName;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectName = await GetVersion.appName;
    } on PlatformException {
      projectName = 'Failed to get app name.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _projectVersion = projectVersion;
      _projectCode = projectCode;
      _projectAppID = projectAppID;
      _projectName = projectName;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(
                width: SizeConfig.blockSizeHorizontal * 100,
                height: SizeConfig.blockSizeVertical * 50,
                child: SvgPicture.asset('assets/images/oval.svg',
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: SafeArea(
              child: _columnContent(context),
            ),
          ),
          MenuRequests(
              position: position,
              onDragEnd: (details) {
                setState(() => position = details.offset);
              })
        ],
      ),
    );
  }

  Widget _columnContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
              width: SizeConfig.safeBlockHorizontal * 35,
              child: Image.asset('assets/images/logo_bk.png')),
        ),
        Container(
            width: SizeConfig.safeBlockHorizontal * 85,
            child: LoginFormWidget(),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 20.0)
            ])),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(child: _finalText(context)),
          ),
        ),
        Text(
          "${EnvironmentConfig.ENV} $_projectVersion + $_projectCode ($_platformVersion)",
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _finalText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: ()=> showForgetPasswordAlert(context),
          child: RichText(
            text: TextSpan(
              text: I18n.of(context).loginScreenTextOne,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.0),
                children: <TextSpan>[
                TextSpan(
                    text: I18n.of(context).loginScreenTextTwo,
                    style: TextStyle(fontWeight: FontWeight.w700))
              ],  
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 2),
          height: 5.0,
          width: 50.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
        )
      ],
    );
  }

  void _deleteDataBase() async {
    try {
      await partnerDb.deleteAllPartners();
      await activePartnersDb.deleteAllPartners();
    } catch (e) {
      print('error: $e');
    }
  }
}
