import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/user_controller.dart';
import 'package:ifes_solar/pages/user/widgets/user_simulation_item_widget.dart';
import 'package:ifes_solar/widgets/custom_loading_widget.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class UserSimulationsPage extends StatefulWidget {
  const UserSimulationsPage({Key? key}) : super(key: key);

  @override
  State<UserSimulationsPage> createState() => _UserSimulationsPageState();
}

class _UserSimulationsPageState extends State<UserSimulationsPage> {
  final UserController userController = Get.find<UserController>();

  @override
  void initState() {
    userController.getUserSimulations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();
    return CustomScaffold(
        title: 'Minhas simulações',
        withArrow: true,
        body: Obx(
          () => userController.isUserSimulationsLoading
              ? Center(child: CustomLoading())
              : userController.userSimulations.length == 0
                  ? Center(
                      child: CustomText('Você não possui simulações.'),
                    )
                  : Padding(
                      padding: EdgeInsets.all(16),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 8,
                        ),
                        itemCount: userController.userSimulations.length,
                        itemBuilder: (context, index) {
                          final item = userController.userSimulations[index];

                          return UserSimulationItem(
                              title: item.title,
                              date: item.date,
                              onPressed: () => Get.toNamed('/UserSimulation',
                                  arguments: item));
                        },
                      ),
                    ),
        ));
  }
}
