import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  const Chart(
  {Key key,
      @required this.title,
      @required this.total,
      this.values,
      @required this.spotList,
      this.axisTitle,
      this.maxY
  })
      : super(key: key);

  final String title;
  final String axisTitle;
  final String total;
  final List<dynamic> values;
  final List<FlSpot> spotList;
  final double maxY;

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Color> gradientColors = [
    const Color(0xff7FF3FF),
    const Color(0xff41B2ED),
  ];
  List<String> months = ['', 'MAY', 'JUN', 'JUL', 'AGO', 'SEP', 'OCT', ''];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 18.0, left: 15.0, bottom: 5.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(widget.title,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.grayColor)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
                '${I18n.of(context).reportsScreenTotal} ${widget.total}',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor,
                    fontSize: 15.0,
                    letterSpacing: 0.5)),
          ),
          Expanded(child: _chart())
        ],
      ),
    );
  }

  Widget _chart() {
    return Container(
      width: double.infinity,
      child: LineChart(LineChartData(
          lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Theme.of(context).colorScheme.grayColor,
                  getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                    return touchedBarSpots.map((barSpot) {
                      final flSpot = barSpot;
                      if (flSpot.x == 0 || flSpot.x == 7.4) return null;
                      return LineTooltipItem(
                          'Meeting ${flSpot.x.toInt()} \n${flSpot.y} ${widget.axisTitle.toLowerCase()}',
                          TextStyle(color: Colors.white));
                    }).toList();
                  }),
              getTouchedSpotIndicator:
                  (LineChartBarData barData, List<int> spotIndexes) {
                return spotIndexes.map((spotIndex) {
                  return TouchedSpotIndicatorData(
                      FlLine(
                          color: Theme.of(context)
                              .colorScheme
                              .primaryColorDark[50],
                          strokeWidth: 1),
                      FlDotData());
                }).toList();
              }),
          gridData: FlGridData(drawHorizontalLine: false),
          titlesData: FlTitlesData(
            show: true,
            leftTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: (value) => '# ${value.toInt().toString()}',
              getTextStyles: (value) => TextStyle(
                  color: Theme.of(context).colorScheme.grayColor,
                  fontSize: 10,
                  letterSpacing: 1),
            ),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 6.5,
          minY: 0,
          maxY: widget.maxY,
          axisTitleData: FlAxisTitleData(
              leftTitle: AxisTitle(
                  titleText: '# ${widget.axisTitle}',
                  textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor,
                      fontSize: 10.0,
                      letterSpacing: 2),
                  showTitle: true)),
          lineBarsData: _lineBarsData())),
    );
  }

  List<LineChartBarData> _lineBarsData() {
    return [
      LineChartBarData(
        spots: widget.spotList,
        isCurved: true,
        isStepLineChart: false,
        colors: gradientColors,
        barWidth: 3,
        preventCurveOverShooting: true,

        isStrokeCapRound: false,
        dotData: FlDotData(
            show: true,
            // checkToShowDot: (spot, barData) {
            //   return spot.x != 7.4 && spot.x != 0;
            // },
            checkToShowDot: (spot, barData) {
              return spot.x >= 0;
            },
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                  color: Theme.of(context).colorScheme.primaryColorDark[50]);
            }),
        curveSmoothness: 0.4,
        belowBarData: BarAreaData(
            show: true,
            gradientFrom: Offset(0.0, 0.0),
            gradientTo: Offset(2.0, 0.0),
            colors:
                gradientColors.map((color) => color.withOpacity(0.8)).toList(),
            spotsLine: BarAreaSpotsLine(
                show: true,
                flLineStyle: FlLine(
                  color: Theme.of(context).colorScheme.primaryColorDark[50],
                  strokeWidth: 1,
                ),
                checkToShowSpotLine: (spot) {
                  if (spot.x == widget.spotList[widget.spotList.length - 2].x)
                    return true;
                  return false;
                })),
      )
    ];
  }
}
