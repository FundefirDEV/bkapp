import 'package:bkapp_flutter/core/bloc/adminCreateBank/admin_create_bank_form_bloc.dart';
import 'package:bkapp_flutter/core/bloc/adminCreateBank/bloc/admin_create_bank_bloc.dart';
import 'package:bkapp_flutter/src/screens/adminCreateBank/widgets/admin_create_bank_sreen_container.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AdminCreateBankScreen extends StatefulWidget {
  AdminCreateBankScreen({
    @required this.userName,
    @required this.tokenUser,
    @required this.role,
  });
  final String userName;
  final String tokenUser;
  final String role;

  @override
  _AdminCreateBankScreenState createState() => _AdminCreateBankScreenState();
}

class _AdminCreateBankScreenState extends State<AdminCreateBankScreen> {
  @override
  void initState() {
    BlocProvider.of<AdminCreateBankBloc>(context).add(AdminCreateBankInitialize(
      token: widget.tokenUser,
      role: widget.role,
    ));

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

      return Builder(builder: (context) {
        AdminCreateBankFormBloc adminCreateBankFormBloc =
            context.read<AdminCreateBankFormBloc>();
        adminCreateBankFormBloc.token.updateValue(widget.tokenUser);
        return FormBlocListener<AdminCreateBankFormBloc, dynamic, dynamic>(
            onSuccess: (context, state) {},
            onFailure: (context, state) {
              UtilsTools.showErrorDialog(context, state.failureResponse);
            },
            child: AppBarWidget(
                userName: widget.userName,
                container: AdminCreateBankScreenContainer(
                  isAdmin: true,
                  adminCreateBankFormBloc: adminCreateBankFormBloc,
                )));
      });
    });
  }
}
