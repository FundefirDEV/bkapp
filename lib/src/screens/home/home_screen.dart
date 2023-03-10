import 'package:bkapp_flutter/core/bloc/home/home_bloc.dart';
import 'package:bkapp_flutter/src/screens/home/widgets/optionsBk/options_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/home/widgets/tabInformationBk/tab_information_bk_widget.dart';
import 'package:bkapp_flutter/src/utils/after_layaut.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/lineSeparator/line_separator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.tokenUser, this.userName}) : super(key: key);
  final String tokenUser;
  final String userName;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AfterLayoutMixin<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeBuilder(userName: widget.userName);
  }

  @override
  void afterFirstLayout(BuildContext context) {
    BlocProvider.of<HomeBloc>(context)
        .add(HomeInitialize(token: widget.tokenUser));
  }
}

class HomeBuilder extends StatelessWidget {
  HomeBuilder({Key key, this.userName}) : super(key: key);
  final String userName;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      final dataState = state is HomeLoaded ? state : null;

      return Scaffold(
          body: AppBarWidget(
              container: _containerMyData(context, dataState),
              userName: this.userName));
    });
  }

  Widget _containerMyData(BuildContext context, HomeLoaded state) {
    return Container(
      child: Column(
        children: <Widget>[
          TabInformationBkWidget(state: state),
          LineSeparatorWidget(),
          OptionsBkWidget()
        ],
      ),
    );
  }
}
