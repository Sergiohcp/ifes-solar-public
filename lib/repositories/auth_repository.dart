import 'package:ifes_solar/infra/api.dart';

class AuthRepository {
  final SolarApi api;

  AuthRepository({required this.api});

  Future register(String username, String email, String password) {
    return this.api.post('/api/auth/local/register',
        {'username': username, 'email': email, 'password': password});
  }

  Future login(String email, String password) {
    return this
        .api
        .post('/api/auth/local', {'identifier': email, 'password': password});
  }
}
