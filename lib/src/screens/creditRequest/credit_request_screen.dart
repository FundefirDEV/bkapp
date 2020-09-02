import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/approvalBloc/approvals_bloc.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/models/approvals_model.dart';
import 'package:bkapp_flutter/core/models/my_bank_model.dart';
import 'package:bkapp_flutter/src/screens/activeCredit/active_credit_screen.dart';
import 'package:bkapp_flutter/src/screens/creditRequest/credit_request_strucuture.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CreditScreen extends StatefulWidget {
  CreditScreen({
    Key key,
    @required this.oldIndex,
    @required this.tokenUser,
    this.userName
  }) : super(key: key);

  final int oldIndex;
  final String tokenUser;
  final String userName;

  @override
  _CreditScreenState createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  @override
  void initState() {
    BlocProvider.of<ApprovalsBloc>(context)
      .add(ApprovalsInitialize(token: widget.tokenUser));
    BlocProvider.of<MyBankBloc>(context)
      .add(GetMyBankInfo(token: widget.tokenUser));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApprovalsBloc, ApprovalsState>(
      builder: (context, state) {
        return BlocBuilder<MyBankBloc, MyBankState>(
          builder: (context, stateBank) {
            if (state is ApprovalsLoaded && stateBank is MyBankLoaded) {
              List<Request> myCreditRequest = 
                state?.approvalsModel?.myRequest?.creditRequest ?? new List();
              List<ActiveCredit> activeCredits = stateBank.data.activeCredits ?? new List();

              if (myCreditRequest.length > 0 && activeCredits.length == 0) {
                return StatusCreditRequestWidget(
                  userName: widget.userName,
                  myCreditRequest: myCreditRequest[0],
                );
              } else if (activeCredits.length > 0) {
                return ActiveCreditScreen(
                  oldIndex: widget.oldIndex,
                  userName: widget.userName,
                  data: activeCredits,
                );
              } else {
                return CreditRequestStructure(
                  oldIndex: widget.oldIndex,
                  tokenUser: widget.tokenUser,
                  userName: widget.userName
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
