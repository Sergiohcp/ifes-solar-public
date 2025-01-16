import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/models/forecast.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class ForecastGraph extends StatelessWidget {
  final Forecast forecast;

  const ForecastGraph({Key? key, required this.forecast}) : super(key: key);

  double getMinY() {
    final double minValue =
        forecast.forecastDataList.map((item) => item.energy).reduce(min) - 5;

    return minValue < 0 ? 0 : minValue;
  }

  double getMaxY() {
    final double maxValue =
        forecast.forecastDataList.map((item) => item.energy).reduce(max);
    return (maxValue + 5).ceilToDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                "Previsão de geração para os proximos 2 dias:",
                variant: CustomTextVariant.heading5,
                color: "gray.dark",
              )
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16, right: 32, bottom: 8),
          child: AspectRatio(
            aspectRatio: 6,
            child: LineChart(
              LineChartData(
                minY: this.getMinY(),
                maxY: this.getMaxY(),
                lineBarsData: [
                  LineChartBarData(
                    spots: forecast.forecastDataList
                        .map((point) => FlSpot(point.x, point.energy))
                        .toList(),
                    isCurved: true,
                    dotData: FlDotData(
                      show: true,
                    ),
                    color: CustomTheme.color.purpleDefault,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          ColorTween(
                                  begin: CustomTheme.color.purpleDefault,
                                  end: CustomTheme.color.purpleDefault)
                              .lerp(0.2)!
                              .withOpacity(0.3),
                          ColorTween(
                                  begin: CustomTheme.color.purpleDefault,
                                  end: CustomTheme.color.purpleDefault)
                              .lerp(0.2)!
                              .withOpacity(0.3),
                        ],
                      ),
                    ),
                  ),
                ],
                borderData: FlBorderData(
                    border:
                        const Border(bottom: BorderSide(), left: BorderSide())),
                gridData: FlGridData(
                    show: true, verticalInterval: 10, horizontalInterval: 20),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    axisNameWidget: CustomText("Energia (kWh)"),
                    sideTitles: SideTitles(
                      reservedSize: 44,
                      showTitles: true,
                    ),
                  ),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                      axisNameWidget: CustomText("Data"),
                      sideTitles: _bottomTitles),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  SideTitles get _bottomTitles => SideTitles(
        reservedSize: 60,
        showTitles: true,
        interval: 10,
        getTitlesWidget: (value, meta) {
          final foundValue = forecast.forecastDataList
              .firstWhereOrNull((item) => item.x.toInt() == value.toInt());

          if (foundValue == null) {
            return Container();
          }

          return Column(
            children: [
              CustomText(
                "**${foundValue.date.split(" ")[0]}**",
                variant: CustomTextVariant.paragraphSmall,
              ),
              CustomText(
                foundValue.date.split(" ")[1],
                variant: CustomTextVariant.paragraphSmall,
              )
            ],
          );
        },
      );
}
