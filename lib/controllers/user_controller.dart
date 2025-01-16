import 'dart:convert';

import 'package:get/get.dart';
import 'package:ifes_solar/controllers/simulation_controller.dart';
import 'package:ifes_solar/factories/user_simulation_factory.dart';
import 'package:ifes_solar/models/user.dart';
import 'package:ifes_solar/models/user_simulation.dart';
import 'package:ifes_solar/repositories/user_repository.dart';
import 'package:ifes_solar/utils/date.dart';
import 'package:ifes_solar/utils/toaster.dart';
import 'package:ifes_solar/utils/user_reset.dart';

class UserController {
  final UserRepository userRepository;
  final _user = User().obs;
  final _userSimulations = <UserSimulation>[].obs;
  var _isUserLoading = false.obs;
  var _isUserSimulationsLoading = false.obs;
  var _isSaveUserSimulationLoading = false.obs;

  UserController({required this.userRepository});

  bool get isUserLoading => _isUserLoading.value;

  User get user => _user.value;

  bool get isUserSimulationsLoading => _isUserSimulationsLoading.value;

  bool get isSaveUserSimulationLoading => _isSaveUserSimulationLoading.value;

  List<UserSimulation> get userSimulations => _userSimulations.value;

  void setUserLoading(bool value) {
    _isUserLoading.value = value;
  }

  void setUser(User value) {
    _user.value = value;
  }

  void setIsUserSimulationsLoading(bool value) {
    _isUserSimulationsLoading.value = value;
  }

  void setUserSimulations(List<UserSimulation> value) {
    _userSimulations.value = value;
  }

  void setIsSaveUserSimulationLoading(bool value) {
    _isSaveUserSimulationLoading.value = value;
  }

  Future getUser() async {
    try {
      setUserLoading(true);
      var response = await this.userRepository.getUser();
      if (response.statusCode != 200) {
        userReset();
        showToaster(
            title: "Ops!",
            message:
                "Ocorreu um erro ao realizar a busca de suas informações.");
        return;
      }
      if (response.body != null) {
        var body = jsonDecode(response.body);
        final User user = User.createUser(body);
        setUser(user);
      }
    } catch (error) {
      userReset();
      showToaster(
          title: "Ops!",
          message: "Ocorreu um erro ao realizar a busca de suas informações.");
    } finally {
      setUserLoading(false);
    }
  }

  Future getUserSimulations() async {
    try {
      setIsUserSimulationsLoading(true);
      var response = await this.userRepository.getUserSimulations();
      if (response.statusCode != 200) {
        showToaster(
            title: "Ops!",
            message:
                "Ocorreu um erro ao buscar suas simulações. Tente novamente.");
        return;
      }
      if (response.body != null) {
        var body = jsonDecode(response.body);

        final List<UserSimulation> userSimulations =
            UserSimulationFactory.createUserSimulations(body['data']);

        final List<UserSimulation> filteredUserSimulations = userSimulations
            .where((element) => element.userEmail == user.email)
            .toList();

        setUserSimulations(filteredUserSimulations);
      }
    } catch (error) {
      showToaster(
          title: "Ops!",
          message:
              "Ocorreu um erro ao buscar suas simulações. Tente novamente.");
    } finally {
      setIsUserSimulationsLoading(false);
    }
  }

  Future saveUserSimulation(String title) async {
    try {
      setIsSaveUserSimulationLoading(true);
      final SimulationController simulationController =
          Get.find<SimulationController>();
      final Map dataToSave = {
        'data': {
          'user_email': user.email,
          'date': dateNow(),
          'title': title,
          'panel': simulationController.resultUserSimulation.panel,
          'area': "${simulationController.resultUserSimulation.area}",
          'location': simulationController.resultUserSimulation.location,
          'user_energy': {
            'jan': simulationController.resultUserSimulation.userEnergy.jan,
            'feb': simulationController.resultUserSimulation.userEnergy.feb,
            'mar': simulationController.resultUserSimulation.userEnergy.mar,
            'apr': simulationController.resultUserSimulation.userEnergy.apr,
            'may': simulationController.resultUserSimulation.userEnergy.may,
            'jun': simulationController.resultUserSimulation.userEnergy.jun,
            'jul': simulationController.resultUserSimulation.userEnergy.jul,
            'aug': simulationController.resultUserSimulation.userEnergy.aug,
            'sep': simulationController.resultUserSimulation.userEnergy.sep,
            'oct': simulationController.resultUserSimulation.userEnergy.oct,
            'nov': simulationController.resultUserSimulation.userEnergy.nov,
            'dec': simulationController.resultUserSimulation.userEnergy.dec,
            'annual':
                simulationController.resultUserSimulation.userEnergy.annual,
          },
          'panel_energy': {
            'jan': simulationController.resultUserSimulation.panelEnergy.jan,
            'feb': simulationController.resultUserSimulation.panelEnergy.feb,
            'mar': simulationController.resultUserSimulation.panelEnergy.mar,
            'apr': simulationController.resultUserSimulation.panelEnergy.apr,
            'may': simulationController.resultUserSimulation.panelEnergy.may,
            'jun': simulationController.resultUserSimulation.panelEnergy.jun,
            'jul': simulationController.resultUserSimulation.panelEnergy.jul,
            'aug': simulationController.resultUserSimulation.panelEnergy.aug,
            'sep': simulationController.resultUserSimulation.panelEnergy.sep,
            'oct': simulationController.resultUserSimulation.panelEnergy.oct,
            'nov': simulationController.resultUserSimulation.panelEnergy.nov,
            'dec': simulationController.resultUserSimulation.panelEnergy.dec,
            'annual':
                simulationController.resultUserSimulation.panelEnergy.annual,
          }
        }
      };

      var response = await this.userRepository.saveUserSimulation(dataToSave);
      print(response.body);
      if (response.statusCode != 200) {
        showToaster(
            title: "Ops!",
            message:
                "Ocorreu um erro ao salvar suas simulação. Tente novamente.");
        return;
      }
      Get.offAllNamed('/Home');
      showToaster(title: "Simulação salva");
    } catch (error) {
      showToaster(
          title: "Ops!", message: "Ocorreu um erro ao buscar suas simulações.");
    } finally {
      setIsSaveUserSimulationLoading(false);
    }
  }
}
