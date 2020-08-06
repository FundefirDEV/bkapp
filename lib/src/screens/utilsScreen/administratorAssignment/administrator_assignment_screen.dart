import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:flutter/material.dart';

import 'list_partners.dart';
import 'widgets/switchAdmin/switch_admin_widget.dart';

class AdministratorAssignmentScreen extends StatefulWidget {
  AdministratorAssignmentScreen({Key key}) : super(key: key);

  @override
  _AdministratorAssignmentScreenState createState() =>
      _AdministratorAssignmentScreenState();
}

class _AdministratorAssignmentScreenState
    extends State<AdministratorAssignmentScreen> {
  bool state;
  List<ListPartners> listPartners = [
    ListPartners(
        name: 'Daniel Tavera', isAdmin: false, numberDocument: 10167252738),
    ListPartners(
        name: 'Javier Reyes Cantor', isAdmin: true, numberDocument: 1030646344),
    ListPartners(
        name: 'Marcos Nope', isAdmin: true, numberDocument: 1039787984),
    ListPartners(
        name: 'Jairo Fernandez', isAdmin: false, numberDocument: 19787987),
  ];
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final navigateBloc = context.bloc<MenuNavigatorBloc>();
    return AppBarWidget(
        container: Column(
      key: Key('column_administrator_assignmen_screen'),
      children: <Widget>[
        TitleHeaderWidget(
          title: I18n.of(context).administratorAssignmentTitle,
          navigateBloc: navigateBloc,
          oldIndex: 1,
        ),
        for (var i = 0; i < listPartners.length; i++)
          SwitchAdmin(
            customKey: Key('switch_admin_$i'),
            partnerName: listPartners[i].name,
            isAdmin: listPartners[i].isAdmin,
            callback: _showDialog,
          )
      ],
    ));
  }

  void _showDialog(context, value) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return ImageBottomModal(
            modalHeight: 50.0,
            image: 'assets/images/salo_pre_approved_modal.svg',
            isImageBg: true,
            title: value
                ? I18n.of(context).administratorAssignmentTitleModalAssign
                : I18n.of(context).administratorAssignmentTitleModalRemove,
            titleBold: '',
            isBold: false,
            isBtnAccept: true,
            titleAcceptButton: I18n.of(context).administratorAssignmentAccept,
            titleCloseButton: I18n.of(context).administratorAssignmentClose,
            onPressAccept: () => {Navigator.pop(context)},
            onPressCancel: () => {Navigator.pop(context)},
          );
        });
  }
}
