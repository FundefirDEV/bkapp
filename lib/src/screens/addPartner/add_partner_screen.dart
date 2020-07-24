import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/addPartner/content/top_container_add_partner_screen.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/material.dart';
import 'content/widgets/bottom_text.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';


class AddPartnerScreen extends StatefulWidget {
  final oldIndex;

  AddPartnerScreen({Key key, @required this.oldIndex}) : super(key: key);

  @override
  _AddPartnerScreenState createState() => _AddPartnerScreenState();
}

class _AddPartnerScreenState extends State<AddPartnerScreen> {
  @override
  Widget build(BuildContext context) {
    
    // ignore: close_sinks
    final menuNavigatorBloc = context.bloc<MenuNavigatorBloc>();
    
    SizeConfig().init(context);
    return Scaffold(
        key: Key('scafforld_add_partner_screen'),
        body: AppBarWidget(
            container: Column(
          key: Key('column_add_partner_screen'),
          children: <Widget>[
            TitleHeaderWidget(
              key: Key('title_header_top_partner_screen'),
              title: I18n.of(context).addPartnerPartner,
              navigateBloc: menuNavigatorBloc,
              oldIndex: widget.oldIndex,
            ),
            TopContainerAddPartnerScreen(),
            BottomText()
          ],
        )));
  }
}
