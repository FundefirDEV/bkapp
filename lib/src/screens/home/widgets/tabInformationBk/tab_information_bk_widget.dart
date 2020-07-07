import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/home/widgets/tabInformationBk/widgets/custom_tab_indicator_widget.dart';
import 'package:bkapp_flutter/src/screens/home/widgets/tabInformationBk/widgets/detail_group_data_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/home/widgets/tabInformationBk/widgets/detail_my_data_bk_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class TabInformationBkWidget extends StatefulWidget {
  TabInformationBkWidget({Key key}) : super(key: key);

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
                        style: TextStyle(height: 1.5)),
                  ),
                  Tab(
                    key: Key('tab-group-bk'),
                    child: Text(I18n.of(context).homeScreenGroupBk,
                        style: TextStyle(height: 1.5)),
                  ),
                ]),
          ),
          Container(
            height: 180,
            child: TabBarView(
                controller: _tabController,
                children: [DetailMyDataBkWidget(), DetailGroupDataBkWidget()]),
          ),
        ],
      ),
    );
  }
}