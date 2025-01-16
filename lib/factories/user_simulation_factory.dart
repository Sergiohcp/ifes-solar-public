import 'package:ifes_solar/models/user_simulation.dart';

class UserSimulationFactory {
  static createUserSimulations(List<dynamic> items) {
    return List<UserSimulation>.from(items.map((item) {
      return UserSimulation.createUserSimulation({
        'id': item['id'],
        'attributes': item['attributes'],
      });
    }));
  }
}
