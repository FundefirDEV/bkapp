import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class MultipleTabs extends StatefulWidget {
  const MultipleTabs(
      {Key key,
      @required this.tabsText,
      @required this.tabsContent,
      this.tabContentSize})
      : super(key: key);

  final List<String> tabsText;
  final List<Widget> tabsContent;
  final double tabContentSize;

  @override
  _MultipleTabsState createState() => _MultipleTabsState();
}

class _MultipleTabsState extends State<MultipleTabs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController =
        new TabController(length: widget.tabsText.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
        length: widget.tabsText.length,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                  tabs: widget.tabsText
                      .map((title) => Tab(
                            child: Text(title, style: TextStyle(height: 1.5)),
                          ))
                      .toList()),
            ),
            Container(
              height: widget.tabContentSize,
              child: TabBarView(
                controller: _tabController,
                children: widget.tabsContent,
              ),
            )
          ],
        ));
  }
}
