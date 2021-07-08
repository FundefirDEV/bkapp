import 'package:bkapp_flutter/core/services/sql/sqflite.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/customTabIndicator/custom_tab_indicator_widget.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class TopContainerAddPartnerScreen extends StatefulWidget {
  TopContainerAddPartnerScreen({
    Key key,
    this.tokenUser
  }) : super(key: key);

  final String tokenUser;

  @override
  _TopContainerAddPartnerScreenState createState() =>
      _TopContainerAddPartnerScreenState();
}

class _TopContainerAddPartnerScreenState
    extends State<TopContainerAddPartnerScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PartnerDatabaseProvider pendingPartnersDb;
  ActivePartnersDbProvider activePartnersDb;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    pendingPartnersDb = PartnerDatabaseProvider.db;
    activePartnersDb = ActivePartnersDbProvider.db;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Column(
        key: Key('main_column_top_partner_screen'),
        children: <Widget>[
          Material(
            type: MaterialType.transparency,
            child: Container(
              key: Key('top_container_partner_screen'),
              padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
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
                      key: Key('tab-activos'),
                      child: Text(I18n.of(context).addPartnerActives,
                          style: TextStyle(height: 1)),
                    ),
                    Tab(
                      key: Key('tab-pendientes'),
                      child: Text(I18n.of(context).addPartnerPending,
                          style: TextStyle(height: 1)),
                    ),
                  ]),
            ),
          ),
          Container(
            key: Key('bottom_container_partner_screen'),
            height: SizeConfig.blockSizeVertical * 50,
            child: TabBarView(controller: _tabController, children: [
              PartnersStructureWidget(
                colorButton: Theme.of(context).colorScheme.primaryColor[200],
                //showButton: false,
                gridViewWidth: 0.0,
                tokenUser: widget.tokenUser,
              ),
              PartnersStructureWidget(
                colorButton: Theme.of(context).colorScheme.primaryColor[200],
                gridViewWidth: 0.0,
                tokenUser: widget.tokenUser,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
