import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/models/energy.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class SimulationGraph extends StatelessWidget {
  final Energy userEnergy;
  final Energy panelEnergy;

  SimulationGraph(
      {Key? key, required this.userEnergy, required this.panelEnergy})
      : super(key: key);

  double getMinY() {
    final double minValue = [
          ...this.userEnergy.toPoints(),
          ...this.panelEnergy.toPoints()
        ].map((item) => item.y).reduce(min) -
        300;

    return minValue < 0 ? 0 : minValue;
  }

  double getMaxY() {
    final double maxValue = [
      ...this.userEnergy.toPoints(),
      ...this.panelEnergy.toPoints()
    ].map((item) => item.y).reduce(max);
    return (maxValue + 300).ceilToDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: CustomTheme.color.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                "Seu consumo",
                variant: CustomTextVariant.heading5,
                color: "ambar.carignan",
              ),
              CustomText(
                "X",
                variant: CustomTextVariant.heading4,
                color: "gray.dark",
              ),
              CustomText(
                "Energia gerada",
                variant: CustomTextVariant.heading5,
                color: "green.default",
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 32,
            ),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: LineChart(
                LineChartData(
                  minY: this.getMinY(),
                  maxY: this.getMaxY(),
                  lineBarsData: [
                    LineChartBarData(
                      spots: userEnergy
                          .toPoints()
                          .map((point) => FlSpot(point.x, point.y))
                          .toList(),
                      isCurved: true,
                      dotData: FlDotData(
                        show: true,
                      ),
                      color: CustomTheme.color.ambarCarignan,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            ColorTween(
                                    begin: CustomTheme.color.ambarCarignan,
                                    end: CustomTheme.color.ambarCarignan)
                                .lerp(0.2)!
                                .withOpacity(0.3),
                            ColorTween(
                                    begin: CustomTheme.color.ambarCarignan,
                                    end: CustomTheme.color.ambarCarignan)
                                .lerp(0.2)!
                                .withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                    LineChartBarData(
                      spots: panelEnergy
                          .toPoints()
                          .map((EnergyPoint point) => FlSpot(point.x, point.y))
                          .toList(),
                      isCurved: true,
                      dotData: FlDotData(
                        show: true,
                      ),
                      color: CustomTheme.color.greenDefault,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            ColorTween(
                                    begin: CustomTheme.color.greenDefault,
                                    end: CustomTheme.color.greenDefault)
                                .lerp(0.2)!
                                .withOpacity(0.3),
                            ColorTween(
                                    begin: CustomTheme.color.greenDefault,
                                    end: CustomTheme.color.greenDefault)
                                .lerp(0.2)!
                                .withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ],
                  borderData: FlBorderData(
                      border: const Border(
                          bottom: BorderSide(), left: BorderSide())),
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      axisNameSize: 20,
                      axisNameWidget: CustomText(
                        "Energia (kWh)",
                        variant: CustomTextVariant.paragraphSmall,
                      ),
                      sideTitles: SideTitles(
                        reservedSize: 40,
                        showTitles: true,
                      ),
                    ),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                        axisNameSize: 20,
                        axisNameWidget: CustomText(
                          "Mês",
                          variant: CustomTextVariant.paragraphSmall,
                        ),
                        sideTitles: _bottomTitles),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomText(
              "Seu consumo de energia médio anual é de **${userEnergy.annual.toStringAsFixed(2)} kWh** por mês enquanto que o a energia média gerada pelo painel solar escolhido é de **${panelEnergy.annual.toStringAsFixed(2)} kWh** por mês.",
              color: "gray.dark",
            ),
          )
        ],
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = 'Jan';
              break;
            case 2:
              text = 'Fev';
              break;
            case 3:
              text = 'Mar';
              break;
            case 4:
              text = 'Abr';
              break;
            case 5:
              text = 'Mai';
              break;
            case 6:
              text = 'Jun';
              break;
            case 7:
              text = 'Jul';
              break;
            case 8:
              text = 'Ago';
              break;
            case 9:
              text = 'Set';
              break;
            case 10:
              text = 'Out';
              break;
            case 11:
              text = 'Nov';
              break;
            case 12:
              text = 'Dez';
              break;
          }

          return CustomText(
            text,
            variant: CustomTextVariant.paragraphSmall,
          );
        },
      );
}
