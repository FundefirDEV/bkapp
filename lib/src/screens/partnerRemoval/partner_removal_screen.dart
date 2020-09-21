import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'widgets/widgets.dart';

class PartnerRemovalScreen extends StatefulWidget {
  const PartnerRemovalScreen(
      {Key key, this.userName, @required this.oldIndex, this.data})
      : super(key: key);

  final String userName;
  final int oldIndex;
  final dynamic data;

  @override
  _PartnerRemovalScreenState createState() => _PartnerRemovalScreenState();
}

class _PartnerRemovalScreenState extends State<PartnerRemovalScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      userName: widget.userName,
      container: Column(
        children: [
          TitleHeaderWidget(
              title: I18n.of(context).partnerRemovalTitle,
              oldIndex: widget.oldIndex,
              menuNavigatorBloc: context.bloc<MenuNavigatorBloc>()),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text('David Cuevas',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w100)),
          ),
          InfoMainCard(
            titleBlue: I18n.of(context).partnerRemovalProfits,
            valueBlue: r'$1.000.000',
            bottomValue: '30',
            topValue: r'$0',
          ),
          WithdrawProfits()
          // DebtProfits()
        ],
      ),
    );
  }
}
