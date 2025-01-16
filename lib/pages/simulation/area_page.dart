import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/simulation_controller.dart';
import 'package:ifes_solar/core/theme/custom_image.dart';
import 'package:ifes_solar/widgets/custom_button_widget.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:ifes_solar/widgets/custom_text_field_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class AreaPage extends StatefulWidget {
  const AreaPage({Key? key}) : super(key: key);

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  final SimulationController simulationController =
      Get.find<SimulationController>();

  TextEditingController areaController = TextEditingController();

  @override
  void initState() {
    areaController.text = simulationController.selectedArea != 0
        ? '${simulationController.selectedArea}'.replaceAll('.', ',')
        : '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SimulationController simulationController =
        Get.find<SimulationController>();

    return CustomScaffold(
      //resizeToAvoidBottomInset: false,
      title: "Área",
      withArrow: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  CustomImage.area,
                  scale: 2,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomText(
                  "Agora precisamos saber qual é a área em m² em que serão instalados os módulos:",
                  variant: CustomTextVariant.labelLarge,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    controller: areaController,
                    hintText: '20',
                    onChanged: (value) {
                      var valueReplaced = value.replaceAll(',', '.');
                      final valueSplitted = valueReplaced.split('.');
                      if (valueSplitted.length > 2) return;
                      if (valueSplitted.length > 1 &&
                          valueSplitted[1].length > 2) {
                        valueReplaced =
                            '${valueSplitted[0]}.${valueSplitted[1].substring(0, 2)}';
                      }
                      if (valueReplaced.isNotEmpty) {
                        simulationController
                            .setSelectedArea(double.parse(valueReplaced));
                        return;
                      }
                      simulationController.setSelectedArea(0.0);
                    }),
              ],
            ),
            Obx(
              () => CustomButton(
                text: "Próximo",
                onPressed: () => Get.toNamed('/Consumption'),
                disabled: simulationController.selectedArea == 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
