import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/panel_controller.dart';
import 'package:ifes_solar/controllers/simulation_controller.dart';
import 'package:ifes_solar/pages/simulation/widgets/panels_list_item_widget.dart';
import 'package:ifes_solar/widgets/custom_button_widget.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class PanelsListPage extends StatefulWidget {
  const PanelsListPage({Key? key}) : super(key: key);

  @override
  State<PanelsListPage> createState() => _PanelsListPageState();
}

class _PanelsListPageState extends State<PanelsListPage> {
  final SimulationController simulationController =
      Get.find<SimulationController>();
  final PanelController panelController = Get.find<PanelController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Painéis',
      withArrow: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  CustomText(
                    "Para começar, escolha abaixo um módulo solar de sua preferência. Lembre-se de verificar as informações detalhadas de cada um.",
                    variant: CustomTextVariant.labelLarge,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8,
                      ),
                      itemCount: panelController.panels.length,
                      itemBuilder: (context, index) => Obx(
                        () => PanelsListItem(
                          panel: panelController.panels[index],
                          selectedPanel: simulationController.selectedPanel,
                          onChanged: (dynamic value) {
                            simulationController.setSelectedPanel(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => CustomButton(
                text: "Próximo",
                onPressed: () => Get.toNamed('/Location'),
                disabled: simulationController.selectedPanel.name.isEmpty,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
