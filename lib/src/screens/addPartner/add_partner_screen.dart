import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/addPartner/content/top_container_add_partner_screen.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/material.dart';
import 'content/widgets/bottom_text.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AddPartnerScreen extends StatefulWidget {
  AddPartnerScreen(
      {Key key,
      @required this.oldIndex,
      @required this.userName,
      @required this.tokenUser})
      : super(key: key);
  final oldIndex;
  final String userName;
  final String tokenUser;

  @override
  _AddPartnerScreenState createState() => _AddPartnerScreenState();
}

class _AddPartnerScreenState extends State<AddPartnerScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        key: Key('scafforld_add_partner_screen'),
        body: AppBarWidget(
            userName: widget.userName,
            container: Column(
              key: Key('column_add_partner_screen'),
              children: <Widget>[
                TitleHeaderWidget(
                    key: Key('title_header_top_partner_screen'),
                    title: I18n.of(context).addPartnerPartner,
                    oldIndex: widget.oldIndex,
                    menuNavigatorBloc: context.read<MenuNavigatorBloc>()),
                TopContainerAddPartnerScreen(
                  tokenUser: widget.tokenUser,
                  menuNavigatorBloc: context.read<MenuNavigatorBloc>()
                ),
                BottomText()
              ],
            )));
  }
}
