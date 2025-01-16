import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/forecast_controller.dart';
import 'package:ifes_solar/controllers/simulation_controller.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/utils/modal.dart';
import 'package:ifes_solar/widgets/custom_button_widget.dart';
import 'package:ifes_solar/widgets/custom_loading_widget.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';
import 'package:ifes_solar/widgets/simulation_graph_widget.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final SimulationController simulationController =
      Get.find<SimulationController>();
  final ForecastController forecastController = Get.find<ForecastController>();

  simulateAndGetForecast() async {
    await simulationController.simulate();
    await forecastController.getForecast(
        simulationController.selectedCoordinates.latitude,
        simulationController.selectedCoordinates.longitude);
  }

  @override
  void initState() {
    simulateAndGetForecast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SimulationController simulationController =
        Get.find<SimulationController>();

    return CustomScaffold(
      backgroundColor: CustomTheme.color.white,
      title: "Resultado",
      withArrow: true,
      onPressed: () => Get.offAllNamed('/Home'),
      body: Obx(
        () => !simulationController.isSimulationLoading
            ? Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 24, bottom: 16),
                        child: Column(
                          children: [
                            SimulationGraph(
                                userEnergy: simulationController
                                    .resultUserSimulation.userEnergy,
                                panelEnergy: simulationController
                                    .resultUserSimulation.panelEnergy),
                            if (simulationController
                                    .resultUserSimulation.userEnergy.annual <
                                simulationController
                                    .resultUserSimulation.panelEnergy.annual)
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 16, top: 16, right: 16),
                                child: CustomText(
                                    "Observando o gráfico acima podemos perceber que a média anual de geração de energia solar pelo painel escolhido e no local desejado é superior à média de seu consumo anual, logo pode se considerar válida a implantação do sistema.",
                                    color: "green.default"),
                              ),
                            if (forecastController.shouldShowForecast)
                              Padding(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: CustomButton(
                                    color: CustomTheme.color.blueDefault,
                                    variant: CustomButtonVariant.text,
                                    withArrow: true,
                                    text: "Ver previsão dos próximos dias",
                                    onPressed: () => Get.toNamed('/Forecast')),
                              )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          CustomButton(
                            text: "Salvar simulação",
                            onPressed: () => showSaveSimulationModal(),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                variant: CustomButtonVariant.text,
                                text: "Voltar ao início",
                                onPressed: () => Get.offAllNamed('/Home'),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: CustomLoading(),
              ),
      ),
    );
  }
}
