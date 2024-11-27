import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  final betweenSpace = 0.2;

  BarChartGroupData generateGroupData(
    int x,
    double quickWorkout,
    double cycling,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: betweenSpace + quickWorkout + betweenSpace + cycling,
          toY: 11,
          color: AppColors.chartBgColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: betweenSpace,
          toY: betweenSpace + quickWorkout,
          color: AppColors.secondaryPurpleColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: betweenSpace + quickWorkout + betweenSpace,
          toY: betweenSpace + quickWorkout + betweenSpace + cycling,
          color: AppColors.primaryPinkColor,
          width: 5,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10, color: AppColors.whiteColor);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitles,
                      reservedSize: 20,
                    ),
                  ),
                ),
                barTouchData: BarTouchData(enabled: false),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                barGroups: [
                  generateGroupData(0, 3, 2),
                  generateGroupData(1, 5, 1.7),
                  generateGroupData(2, 3.1, 2.8),
                  generateGroupData(3, 4, 3.1),
                  generateGroupData(4, 3.3, 3.4),
                  generateGroupData(5, 5.6, 1.8),
                  generateGroupData(6, 3.2, 2),
                ],
                maxY: 11 + (betweenSpace * 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
