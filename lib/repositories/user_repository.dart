import 'package:ifes_solar/infra/api.dart';
import 'package:ifes_solar/models/jwt.dart';

class UserRepository {
  final SolarApi api;

  UserRepository({required this.api});

  Future getUser() async {
    final jwt = await Jwt.getJwtToken();
    return await this
        .api
        .get('/api/users/me', {'Authorization': 'Bearer $jwt'});
  }

  Future getUserSimulations() async {
    final jwt = await Jwt.getJwtToken();
    return await this
        .api
        .get('/api/simulations', {'Authorization': 'Bearer $jwt'});
  }

  Future saveUserSimulation(Map data) async {
    final jwt = await Jwt.getJwtToken();
    return await this.api.post('/api/simulations', data,
        {'Authorization': 'Bearer $jwt', "Content-Type": "application/json"});
  }
}
