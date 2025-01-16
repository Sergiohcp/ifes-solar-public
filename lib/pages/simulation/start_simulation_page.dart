import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/simulation_controller.dart';
import 'package:ifes_solar/widgets/custom_button_widget.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class StartSimulationPage extends StatelessWidget {
  const StartSimulationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SimulationController simulationController =
        Get.find<SimulationController>();

    return CustomScaffold(
      title: 'Simulação',
      withArrow: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomText(
                  "Energia solar fotovoltaica nada mais é do que a conversão direta da radiação solar em energia elétrica. Essa conversão é realizada pelas chamadas células fotovoltaicas, compostas por material semicondutor, normalmente o silício. Ao incidir sobre as células, a luz solar provoca a movimentação dos elétrons do material condutor, transportando-os pelo material até serem captados por um campo elétrico (formado por uma diferença de potencial existente entre os semicondutores). Dessa forma, gera-se eletricidade.",
                  color: "gray.dark",
                ),
                SizedBox(
                  height: 16,
                ),
                CustomText(
                  "Que tal realizarmos uma simulação de geração de energia na região de sua escolha?",
                  variant: CustomTextVariant.heading5,
                ),
              ],
            ),
            CustomButton(
                text: "Iniciar simulação",
                onPressed: () {
                  simulationController.clearSimulation();
                  Get.toNamed('/PanelsList');
                }),
          ],
        ),
      ),
    );
  }
}
