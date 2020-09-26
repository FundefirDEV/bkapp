import 'package:bkapp_flutter/core/bloc/home/home_bloc.dart';
import 'package:bkapp_flutter/core/models/bank_info_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/home/widgets/tabInformationBk/widgets/detail_group_data_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/home/widgets/tabInformationBk/widgets/detail_my_data_bk_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/customTabIndicator/custom_tab_indicator_widget.dart';
import 'package:bkapp_flutter/src/widgets/errorPage/error_page.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class TabInformationBkWidget extends StatefulWidget {
  final HomeLoaded state;
  TabInformationBkWidget({Key key, this.state}) : super(key: key);

  @override
  _TabInformationBkWidgetState createState() => _TabInformationBkWidgetState();
}

class _TabInformationBkWidgetState extends State<TabInformationBkWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Personal infoPersonalBk =
        widget.state?.bkInformation?.personal ?? new Personal();
    Group infoGroupBk = widget.state?.bkInformation?.group ?? new Group();
    if (widget.state is HomeLoaded) {
      return DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 2),
              child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelStyle: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      letterSpacing: 3.0),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: CustomTabIndicator(),
                  unselectedLabelColor:
                      Theme.of(context).colorScheme.grayColor[50],
                  tabs: [
                    Tab(
                      key: Key('tab-my-bk'),
                      child: Text(I18n.of(context).homeScreenMyData,
                          key: Key('tab-my-bk-title'),
                          style: TextStyle(height: 1.5)),
                    ),
                    Tab(
                      key: Key('tab-group-bk'),
                      child: Text(I18n.of(context).homeScreenGroupBk,
                          key: Key('tab-group-bk-title'),
                          style: TextStyle(height: 1.5)),
                    ),
                  ]),
            ),
            Container(
              height: 180,
              child: TabBarView(controller: _tabController, children: [
                DetailMyDataBkWidget(information: infoPersonalBk),
                DetailGroupDataBkWidget(information: infoGroupBk)
              ]),
            ),
          ],
        ),
      );
    }
    return Container(
        height: 220,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ));
  }
}
