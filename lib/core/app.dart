import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/pages/about/solar_energy_page.dart';
import 'package:ifes_solar/pages/forecast/forecast_page.dart';
import 'package:ifes_solar/pages/home/home_page.dart';
import 'package:ifes_solar/pages/login/login_page.dart';
import 'package:ifes_solar/pages/register/register_page.dart';
import 'package:ifes_solar/pages/simulation/area_page.dart';
import 'package:ifes_solar/pages/simulation/consumption_page.dart';
import 'package:ifes_solar/pages/simulation/datasheet_page.dart';
import 'package:ifes_solar/pages/simulation/location_page.dart';
import 'package:ifes_solar/pages/simulation/panels_list_page.dart';
import 'package:ifes_solar/pages/simulation/result_page.dart';
import 'package:ifes_solar/pages/simulation/start_simulation_page.dart';
import 'package:ifes_solar/pages/splash/splash_page.dart';
import 'package:ifes_solar/pages/user/user_page.dart';
import 'package:ifes_solar/pages/user/user_simulation_page.dart';
import 'package:ifes_solar/pages/user/user_simulations_page.dart';
import 'package:ifes_solar/utils/dependency.dart';
import 'package:ifes_solar/widgets/dismiss_keyboard_widget.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    startDependencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetMaterialApp(
        title: 'Ifes Solar',
        theme: ThemeData(
            primaryColor: CustomTheme.color.primary,
            inputDecorationTheme: InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: CustomTheme.color.primary),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: CustomTheme.color.grayLight),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: CustomTheme.color.grayLight),
              ),
            ),
            brightness: Brightness.light),
        navigatorKey: Get.key,
        initialRoute: '/Splash',
        getPages: [
          GetPage(name: '/Splash', page: () => SplashPage()),
          GetPage(name: '/Register', page: () => RegisterPage()),
          GetPage(name: '/Login', page: () => LoginPage()),
          GetPage(name: '/Home', page: () => HomePage()),
          GetPage(name: '/User', page: () => UserPage()),
          GetPage(name: '/UserSimulations', page: () => UserSimulationsPage()),
          GetPage(name: '/UserSimulation', page: () => UserSimulationPage()),
          GetPage(name: '/SolarEnergy', page: () => SolarEnergyPage()),
          GetPage(name: '/StartSimulation', page: () => StartSimulationPage()),
          GetPage(name: '/PanelsList', page: () => PanelsListPage()),
          GetPage(name: '/Datasheet', page: () => DatasheetPage()),
          GetPage(name: '/Location', page: () => LocationPage()),
          GetPage(name: '/Area', page: () => AreaPage()),
          GetPage(name: '/Consumption', page: () => ConsumptionPage()),
          GetPage(name: '/Result', page: () => ResultPage()),
          GetPage(name: '/Forecast', page: () => ForecastPage()),
        ],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
