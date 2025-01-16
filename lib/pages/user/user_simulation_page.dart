import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/models/user_simulation.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';
import 'package:ifes_solar/widgets/simulation_graph_widget.dart';

class UserSimulationPage extends StatelessWidget {
  UserSimulationPage({Key? key}) : super(key: key);

  final UserSimulation userSimulation = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: userSimulation.title,
        backgroundColor: CustomTheme.color.white,
        withArrow: true,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 24, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText("Data: **${userSimulation.date}**"),
                    SizedBox(
                      height: 8,
                    ),
                    CustomText("Painel: **${userSimulation.panel}**"),
                    SizedBox(
                      height: 8,
                    ),
                    CustomText("Área: **${userSimulation.area} m²**"),
                    SizedBox(
                      height: 8,
                    ),
                    CustomText("Localização: **${userSimulation.location}**"),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SimulationGraph(
                userEnergy: userSimulation.userEnergy!,
                panelEnergy: userSimulation.panelEnergy!,
              ),
            ],
          ),
        ));
  }
}
