import 'package:bkapp_flutter/core/bloc/adminCreateBank/admin_create_bank_form_bloc.dart';
import 'package:bkapp_flutter/core/bloc/adminCreateBank/bloc/admin_create_bank_bloc.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AdminCreateBankScreen extends StatefulWidget {
  AdminCreateBankScreen({
    Key key,
    @required this.userName,
    @required this.tokenUser,
    @required this.role,
    @required this.partnerId,
    this.oldIndex,
  }) : super(key: key);
  final String userName;
  final String tokenUser;
  final int oldIndex;
  final String role;
  final int partnerId;

  @override
  _AdminCreateBankScreenState createState() => _AdminCreateBankScreenState();
}

class _AdminCreateBankScreenState extends State<AdminCreateBankScreen> {
  @override
  void initState() {
    BlocProvider.of<AdminCreateBankBloc>(context).add(AdminCreateBankInitialize(
        token: widget.tokenUser,
        role: widget.role,
        parnerId: widget.partnerId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocBuilder<AdminCreateBankBloc, AdminCreateBankState>(
        builder: (context, state) {
      if (state is AdminCreateBankFailure) {
        return ErrorPage(errorMessage: state.error);
      }

      if (state is AdminCreateBankLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is AdminCreateBankPartnerNotAdmin) {
        return AppBarWidget(userName: widget.userName, container: Container());
      }

      return Builder(builder: (context) {
        // ignore: close_sinks
        AdminCreateBankFormBloc adminCreateBankFormBloc =
            context.read<AdminCreateBankFormBloc>();

        if (state is AdminCreateBankLoaded) {}

        return FormBlocListener<AdminCreateBankFormBloc, dynamic, dynamic>(
            key: Key('bloc-listener-profit-payment-screen'),
            // onSuccess: (context, state) {
            //   context.read<AdminCreateBankBloc>().add(
            //       AdminCreateBankPartnerSelected(
            //           idPartner:
            //               adminCreateBankFormBloc.idPartner.value.toString(),
            //           token: widget.tokenUser));
            // },
            onFailure: (context, state) {
              UtilsTools.showErrorDialog(context, state.failureResponse);
            },
            child: AppBarWidget(
              userName: widget.userName,
              container: Container(),
            ));
      });
    });
  }
}
