import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/simulation_controller.dart';
import 'package:ifes_solar/models/consumption.dart';
import 'package:ifes_solar/widgets/custom_button_widget.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:ifes_solar/widgets/custom_text_field_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class ConsumptionPage extends StatefulWidget {
  const ConsumptionPage({Key? key}) : super(key: key);

  @override
  State<ConsumptionPage> createState() => _ConsumptionPageState();
}

class _ConsumptionPageState extends State<ConsumptionPage> {
  final SimulationController simulationController =
      Get.find<SimulationController>();

  final _formKey = GlobalKey<FormState>();

  final List<TextEditingController> controllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<String> monthList = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
  ];

  @override
  Widget build(BuildContext context) {
    final SimulationController simulationController =
        Get.find<SimulationController>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: CustomScaffold(
        title: "Consumo",
        withArrow: true,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: Expanded(
                  child: Column(
                    children: [
                      CustomText(
                        "E para finalizar, digite abaixo os valores de consumo mensal atual do local escolhido:",
                        variant: CustomTextVariant.labelLarge,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 16,
                          ),
                          itemCount: 12,
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                monthList[index],
                                variant: CustomTextVariant.label,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomTextField(
                                controller: controllerList[index],
                                hintText: "0",
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: "Próximo",
                onPressed: () {
                  _formKey.currentState?.validate();
                  if (_formKey.currentState!.validate()) {
                    var consumption = Consumption(
                        jan: controllerList[0].text.isEmpty
                            ? 0
                            : double.parse(
                                controllerList[0].text.replaceAll(',', '.')),
                        feb: controllerList[1].text.isEmpty
                            ? 0
                            : double.parse(
                                controllerList[1].text.replaceAll(',', '.')),
                        mar: controllerList[2].text.isEmpty
                            ? 0
                            : double.parse(
                                controllerList[2].text.replaceAll(',', '.')),
                        apr: controllerList[3].text.isEmpty
                            ? 0
                            : double.parse(
                                controllerList[3].text.replaceAll(',', '.')),
                        may: controllerList[4].text.isEmpty
                            ? 0
                            : double.parse(
                                controllerList[4].text.replaceAll(',', '.')),
                        jun: controllerList[5].text.isEmpty
                            ? 0
                            : double.parse(
                                controllerList[5].text.replaceAll(',', '.')),
                        jul: controllerList[6].text.isEmpty
                            ? 0
                            : double.parse(controllerList[6].text.replaceAll(',', '.')),
                        aug: controllerList[7].text.isEmpty ? 0 : double.parse(controllerList[7].text.replaceAll(',', '.')),
                        sep: controllerList[8].text.isEmpty ? 0 : double.parse(controllerList[8].text.replaceAll(',', '.')),
                        oct: controllerList[9].text.isEmpty ? 0 : double.parse(controllerList[9].text.replaceAll(',', '.')),
                        nov: controllerList[10].text.isEmpty ? 0 : double.parse(controllerList[10].text.replaceAll(',', '.')),
                        dec: controllerList[11].text.isEmpty ? 0 : double.parse(controllerList[11].text.replaceAll(',', '.')));

                    simulationController.setSelectedConsumption(consumption);
                    Get.toNamed('/Result');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
