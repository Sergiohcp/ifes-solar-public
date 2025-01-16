import 'package:ifes_solar/infra/api.dart';

class SimulationRepository {
  final SolarApi api;

  SimulationRepository({required this.api});

  Future generateEnergy(
      int id, double latitude, double longitude, double area) async {
    return await this.api.post('/api/panel/generate-energy',
        {'id': id, 'latitude': latitude, 'longitude': longitude, 'area': area});
  }
}
