import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/forecast_controller.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:ifes_solar/widgets/forecast_graph_widget.dart';

class ForecastPage extends StatelessWidget {
  ForecastPage({Key? key}) : super(key: key);

  final ForecastController forecastController = Get.find<ForecastController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        backgroundColor: CustomTheme.color.white,
        title: "Previsão",
        withArrow: true,
        body: forecastController.forecast.forecastDataList.length != 0
            ? SingleChildScrollView(
                padding: EdgeInsets.only(top: 24),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: 4000,
                    child: ForecastGraph(
                      forecast: forecastController.forecast,
                    ),
                  ),
                ),
              )
            : Container());
  }
}
