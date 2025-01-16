import 'dart:convert';

import 'package:get/get.dart';
import 'package:ifes_solar/models/consumption.dart';
import 'package:ifes_solar/models/coordinates.dart';
import 'package:ifes_solar/models/panel.dart';
import 'package:ifes_solar/models/user_simulation.dart';
import 'package:ifes_solar/repositories/simulation_repository.dart';
import 'package:ifes_solar/utils/date.dart';

class SimulationController {
  final SimulationRepository simulationRepository;

  final _selectedPanel = Panel().obs;
  final _selectedCoordinates = Coordinates().obs;
  final _selectedLocation = "".obs;
  final _selectedArea = 0.0.obs;
  final _selectedConsumption = Consumption().obs;
  final _isSimulationLoading = true.obs;
  final Rx<UserSimulation> _resultUserSimulation = UserSimulation().obs;

  SimulationController({required this.simulationRepository});

  Panel get selectedPanel => _selectedPanel.value;

  Coordinates get selectedCoordinates => _selectedCoordinates.value;

  String get selectedLocation => _selectedLocation.value;

  double get selectedArea => _selectedArea.value;

  Consumption get selectedConsumption => _selectedConsumption.value;

  bool get isSimulationLoading => _isSimulationLoading.value;

  UserSimulation get resultUserSimulation => _resultUserSimulation.value;

  void setSelectedPanel(Panel value) {
    _selectedPanel.value = value;
  }

  void setSelectedCoordinates(Coordinates value) {
    _selectedCoordinates.value = value;
  }

  void setSelectedLocation(String value) {
    _selectedLocation.value = value;
  }

  void setSelectedArea(double value) {
    _selectedArea.value = value;
  }

  void setSelectedConsumption(Consumption value) {
    _selectedConsumption.value = value;
  }

  void setIsSimulationLoading(bool value) {
    _isSimulationLoading.value = value;
  }

  void setResultUserSimulation(UserSimulation value) {
    _resultUserSimulation.value = value;
  }

  void clearSimulation() {
    setSelectedPanel(Panel());
    _selectedCoordinates(Coordinates());
    setSelectedArea(0.0);
    setSelectedConsumption(Consumption());
  }

  simulate() async {
    try {
      setIsSimulationLoading(true);

      var response = await this.simulationRepository.generateEnergy(
          selectedPanel.id,
          selectedCoordinates.latitude,
          selectedCoordinates.longitude,
          selectedArea);
      if (response.body != null) {
        var body = jsonDecode(response.body);
        final resultUserSimulation = UserSimulation.createUserSimulation({
          'attributes': {
            'date': dateNow(),
            'panel': '${selectedPanel.name} (${selectedPanel.producer})',
            'area': '${selectedArea}',
            'location':
                "${selectedLocation} (${selectedCoordinates.latitude}, ${selectedCoordinates.longitude})",
            'user_energy': {
              'jan': selectedConsumption.jan,
              'feb': selectedConsumption.feb,
              'mar': selectedConsumption.mar,
              'apr': selectedConsumption.apr,
              'may': selectedConsumption.may,
              'jun': selectedConsumption.jun,
              'jul': selectedConsumption.jul,
              'aug': selectedConsumption.aug,
              'sep': selectedConsumption.sep,
              'oct': selectedConsumption.oct,
              'nov': selectedConsumption.nov,
              'dec': selectedConsumption.dec,
              'annual': selectedConsumption.getAnnual(),
            },
            'panel_energy': {
              'jan': body['data']['energy']['jan'],
              'feb': body['data']['energy']['fev'],
              'mar': body['data']['energy']['mar'],
              'apr': body['data']['energy']['abr'],
              'may': body['data']['energy']['mai'],
              'jun': body['data']['energy']['jun'],
              'jul': body['data']['energy']['jul'],
              'aug': body['data']['energy']['ago'],
              'sep': body['data']['energy']['set'],
              'oct': body['data']['energy']['out'],
              'nov': body['data']['energy']['nov'],
              'dec': body['data']['energy']['dez'],
              'annual': body['data']['energy']['anual'] / 12
            }
          }
        });
        setResultUserSimulation(resultUserSimulation);
      }
    } finally {
      setIsSimulationLoading(false);
    }
  }

  testSimulation() async {
    try {
      var response = await this
          .simulationRepository
          .generateEnergy(1, -20.312341, -40.2902383, 20);
      if (response.body != null) {
        var body = jsonDecode(response.body);
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
