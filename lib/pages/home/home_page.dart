import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/auth_controller.dart';
import 'package:ifes_solar/controllers/panel_controller.dart';
import 'package:ifes_solar/controllers/simulation_controller.dart';
import 'package:ifes_solar/controllers/user_controller.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/pages/home/widgets/home_list_item_widget.dart';
import 'package:ifes_solar/widgets/custom_app_bar_widget.dart';
import 'package:ifes_solar/widgets/custom_loading_widget.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthController authController = Get.find<AuthController>();
  final UserController userController = Get.find<UserController>();
  final PanelController panelController = Get.find<PanelController>();
  final SimulationController simulationController =
      Get.find<SimulationController>();

  getUserAndPanels() async {
    await Future.delayed(Duration.zero);
    await userController.getUser();
    await panelController.getPanels();
  }

  @override
  void initState() {
    getUserAndPanels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = [
      {
        'title': 'Energia solar',
        'onTap': () {
          Get.toNamed('/SolarEnergy');
        },
        'isHighlight': false,
      },
      {
        'title': 'Minhas simulações',
        'onTap': () {
          Get.toNamed('/UserSimulations');
        },
        'isHighlight': false,
      },
      {
        'title': 'Simular',
        'onTap': () {
          Get.toNamed('/StartSimulation');
        },
        'isHighlight': true,
      },
      // {
      //   'title': 'Meus dados',
      //   'onTap': () {
      //     Get.toNamed('/User');
      //   },
      //   'isHighlight': false,
      // },
    ];

    return CustomScaffold(
      appBar: CustomAppBar(
        title: Obx(() => CustomText(
              userController.user.name.isEmpty
                  ? 'Olá!'
                  : 'Olá, ${userController.user.name.split(" ")[0]}!',
              variant: CustomTextVariant.subtitle2,
              fontSize: CustomTextFontSize.xl,
              color: 'white',
            )),
        actions: [
          IconButton(
            onPressed: authController.logout,
            icon: Icon(
              Icons.logout,
              color: CustomTheme.color.white,
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          )
        ],
      ),
      body: Obx(
          () => userController.isUserLoading || panelController.isPanelsLoading
              ? Center(child: CustomLoading())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      CustomText(
                          'Bem vindo ao Ifes Solar, a plataforma de simulação do IFES para comparação entre o consumo mensal residencial de energia e geração fotovoltáica.',
                          variant: CustomTextVariant.labelLarge,
                          color: 'gray.dark'),
                      SizedBox(
                        height: 24,
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 16,
                          ),
                          itemCount: list.length,
                          itemBuilder: (context, index) => HomeListItem(
                            title: list[index]['title'] as String,
                            onTap: list[index]['onTap'] as VoidCallback,
                            isHighlight: list[index]['isHighlight'] as bool,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}
