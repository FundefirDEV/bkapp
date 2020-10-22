import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/timeLineShares/bloc/time_line_shares_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/timeLineMyShares/widgets/box_shares_widget.dart';
import 'package:bkapp_flutter/src/screens/timeLineMyShares/widgets/time_line_widget.dart';
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class TimeLineMySharesScreen extends StatefulWidget {
  TimeLineMySharesScreen(
      {Key key, @required this.userName, @required this.tokenUser})
      : super(key: key);
  final String userName;
  final String tokenUser;
  @override
  _TimeLineMySharesScreenState createState() => _TimeLineMySharesScreenState();
}

class _TimeLineMySharesScreenState extends State<TimeLineMySharesScreen> {
  @override
  void initState() {
    BlocProvider.of<TimeLineSharesBloc>(context)
        .add(TimeLineSharesInitialize(token: widget.tokenUser));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<TimeLineSharesBloc, TimeLineSharesState>(
        builder: (context, state) {
      if (state is TimeLineSharesLoaded) {
        return Builder(
          builder: (context) {
            return AppBarWidget(
                userName: widget.userName,
                container: Column(children: [
                  TitleHeaderWidget(
                      oldIndex: HomeRoutesConstant.homeScreen,
                      title: I18n.of(context).timeLineSharesTitle,
                      menuNavigatorBloc: context.bloc<MenuNavigatorBloc>()),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BoxSharesWidget(
                                shares: state.timeLineShares.totalShares),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.timeLineShares.shares.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return TimeLineWidget(
                                      model:
                                          state.timeLineShares.shares[index]);
                                })
                          ]))
                ]));
          },
        );
      }
      if (state is TimeLineSharesFailure) {
        return ErrorPage(errorMessage: state.error);
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
