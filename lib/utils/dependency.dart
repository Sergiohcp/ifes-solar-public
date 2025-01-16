import 'package:get/get.dart';
import 'package:ifes_solar/controllers/auth_controller.dart';
import 'package:ifes_solar/controllers/forecast_controller.dart';
import 'package:ifes_solar/controllers/panel_controller.dart';
import 'package:ifes_solar/controllers/simulation_controller.dart';
import 'package:ifes_solar/controllers/user_controller.dart';
import 'package:ifes_solar/infra/api.dart';
import 'package:ifes_solar/repositories/auth_repository.dart';
import 'package:ifes_solar/repositories/forecast_repository.dart';
import 'package:ifes_solar/repositories/panel_repository.dart';
import 'package:ifes_solar/repositories/simulation_repository.dart';
import 'package:ifes_solar/repositories/user_repository.dart';

void startDependencies() {
  final authRepository = AuthRepository(api: api);
  final userRepository = UserRepository(api: api);
  final panelRepository = PanelRepository(api: api);
  final forecastRepository = ForecastRepository(api: solcastApi);
  final simulationRepository = SimulationRepository(api: api);
  Get.put<AuthController>(AuthController(authRepository: authRepository));
  Get.put<UserController>(UserController(userRepository: userRepository));
  Get.put<PanelController>(PanelController(panelRepository: panelRepository));
  Get.put<SimulationController>(
      SimulationController(simulationRepository: simulationRepository));
  Get.put<ForecastController>(
      ForecastController(forecastRepository: forecastRepository));
}
