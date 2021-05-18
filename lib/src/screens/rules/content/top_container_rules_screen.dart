import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/rules/content/top_container_content_rules_screen.dart';
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class TopContainerRulesSceen extends StatelessWidget {
  const TopContainerRulesSceen({Key key, this.navigateBloc, this.bankRules})
      : super(key: key);
  // ignore: close_sinks
  final navigateBloc;
  final BankRulesModel bankRules;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('top_container_rules_screen'),
      height: SizeConfig.safeBlockVertical * 40,
      width: SizeConfig.safeBlockHorizontal * 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryColorDark[50],
            Theme.of(context).colorScheme.primaryColor[100]
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TopContainerContentRulesScreen().saloAndArrow(),
          Container(
            margin: EdgeInsets.only(left: SizeConfig.safeBlockVertical * 3.5),
            child: TitleHeaderWidget(
                title: I18n.of(context).rulesScreenBkRules,
                oldIndex: HomeRoutesConstant.utilsScreen,
                menuNavigatorBloc: context.read<MenuNavigatorBloc>()),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 1.3,
          ),
          topContainerInformation(context),
          // Container(
          //     height: SizeConfig.safeBlockVertical * 4,
          //     child: FlatButton(
          //         key: Key('edit_button_rules_screen'),
          //         onPressed: () => navigateBloc.add(ButtonPressed(goTo: 9)),
          //         child: Text(
          //           I18n.of(context).profileScreenEdit,
          //           style: TextStyle(color: Colors.white),
          //         )))
        ],
      ),
    );
  }

  Container topContainerInformation(context) {
    return Container(
      key: Key('top_container_information_rules_Screen'),
      height: SizeConfig.safeBlockVertical * 17,
      child: Row(
        key: Key('row_top_container_rules_Screen'),
        children: <Widget>[
          Container(
              key: Key('top_container_information_rules_Screen'),
              margin: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 15,
                right: SizeConfig.safeBlockHorizontal * 4,
                bottom: SizeConfig.safeBlockHorizontal * 5,
              ),
              child: Container(
                  height: SizeConfig.blockSizeVertical * 40,
                  width: SizeConfig.blockSizeHorizontal * 30,
                  child: SvgPicture.asset(
                    'assets/images/logo_rules_screen.svg',
                  ))),
          Column(
            key: Key('text_column_top_container_rules_sreen'),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    richTextBuild(context, bankRules),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // SvgPicture.asset('assets/images/colombia_profile.svg'),
                        // Text(
                        //   'Bogotá',
                        //   style: TextStyle(color: Colors.white),
                        // ),
                        // SizedBox(
                        //   width: SizeConfig.safeBlockHorizontal * 15,
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  RichText richTextBuild(context, BankRulesModel bankRules) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final date = bankRules.creationDate != null
        ? formatter.format(DateTime.parse(bankRules.creationDate))
        : '';
    return RichText(
      textAlign: TextAlign.left,
      strutStyle: StrutStyle(height: 1.5),
      text: TextSpan(
          text: bankRules.bankName + '\n',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          children: <TextSpan>[
            TextSpan(
              text: I18n.of(context).rulesScreenCreationDate + '\n',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: date.toString(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            )
          ]),
    );
  }
}
