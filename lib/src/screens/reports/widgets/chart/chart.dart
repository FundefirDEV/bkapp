import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  const Chart({Key key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Color> gradientColors = [
    const Color(0xff7FF3FF),
    const Color(0xff41B2ED),
  ];
  List<String> months = ['', 'MAY', 'JUN', 'JUL', 'AGO', 'SEP', 'OCT', ''];
  List<FlSpot> spotList = [
    FlSpot(0, 0),
    FlSpot(2.5, 3),
    FlSpot(5.8, 4.5),
    FlSpot(7.4, 8),
  ];

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
            child: Text(I18n.of(context).reportsScreenChartTitle,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.grayColor)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
                '${I18n.of(context).reportsScreenChartTotal} ' +
                    r'$' +
                    '100.000',
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
                          '${months[flSpot.x.toInt()]} \n${flSpot.y} acciones',
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
              getTitles: (value) => months[value.toInt()],
              getTextStyles: (value) => TextStyle(
                  color: Theme.of(context).colorScheme.grayColor,
                  fontSize: 10,
                  letterSpacing: 1),
            ),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 7.4,
          minY: 0,
          maxY: 10,
          axisTitleData: FlAxisTitleData(
              leftTitle: AxisTitle(
                  titleText: I18n.of(context).reportsScreenChartAxisTitle,
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
        spots: spotList,
        isCurved: true,
        colors: gradientColors,
        barWidth: 0,
        isStrokeCapRound: false,
        dotData: FlDotData(
            show: true,
            checkToShowDot: (spot, barData) {
              return spot.x != 7.4 && spot.x != 0;
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
                  if (spot.x == spotList[spotList.length - 2].x) return true;
                  return false;
                })),
      )
    ];
  }
}
