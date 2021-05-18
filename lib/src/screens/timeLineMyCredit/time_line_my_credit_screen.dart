import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/timeLineCredit/time_line_credit_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/timeLineMyCredit/widgets/box_credit_widget.dart';
import 'package:bkapp_flutter/src/screens/timeLineMyCredit/widgets/time_line_credit.dart';
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class TimeLineMyCreditScreen extends StatefulWidget {
  TimeLineMyCreditScreen({Key key, this.userName, this.tokenUser})
      : super(key: key);
  final String userName;
  final String tokenUser;
  @override
  _TimeLineMyCreditScreenState createState() => _TimeLineMyCreditScreenState();
}

class _TimeLineMyCreditScreenState extends State<TimeLineMyCreditScreen> {
  @override
  void initState() {
    BlocProvider.of<TimeLineCreditBloc>(context)
        .add(TimeLineCreditInitialize(token: widget.tokenUser));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeLineCreditBloc, TimeLineCreditState>(
      builder: (context, state) {
        if (state is TimeLineCreditLoaded) {
          return Builder(
            builder: (context) {
              return AppBarWidget(
                  userName: widget.userName,
                  container: Column(children: [
                    TitleHeaderWidget(
                        oldIndex: HomeRoutesConstant.homeScreen,
                        title: I18n.of(context).timeLineCreditsTitle,
                        menuNavigatorBloc: context.read<MenuNavigatorBloc>()),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BoxCreditWidget(shares: state.timeLineCredit.total),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.timeLineCredit.credits.length,
                              itemBuilder: (BuildContext context, int index) {
                                return TimeLineCreditWidget(
                                    model: state.timeLineCredit.credits[index]);
                              })
                        ],
                      ),
                    )
                  ]));
            },
          );
        }
        if (state is TimeLineCreditFailure) {
          return ErrorPage(errorMessage: state.error);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
