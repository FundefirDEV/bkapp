import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/customTabIndicator/custom_tab_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

import 'widgets/widgets.dart';

class TabCreditTypeWidget extends StatefulWidget {
  TabCreditTypeWidget({Key key}) : super(key: key);

  @override
  _TabCreditTypeWidget createState() => _TabCreditTypeWidget();
}

class _TabCreditTypeWidget extends State<TabCreditTypeWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 1,
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
                    child: Text(
                        I18n.of(context).creditScreenTabTitleOne.toUpperCase(),
                        style: TextStyle(height: 1.5)),
                  ),
                  // TODO This tab will be activated when special credit exists
                  // Tab(
                  //   key: Key('tab-group-bk'),
                  //   child: Text(
                  //     I18n.of(context).creditScreenTabTitleTwo.toUpperCase(),
                  //     style: TextStyle(height: 1.5)),
                  // ),
                ]),
          ),
          Container(
            height: 180,
            child: TabBarView(controller: _tabController, children: [
              NormalCredit(),
              // SpecialCredit()
            ]),
          ),
        ],
      ),
    );
  }
}
