import 'package:ifes_solar/infra/api.dart';
import 'package:ifes_solar/models/jwt.dart';

class PanelRepository {
  final SolarApi api;

  PanelRepository({required this.api});

  Future getPanels() async {
    final jwt = await Jwt.getJwtToken();
    return await this.api.get('/api/panels', {'Authorization': 'Bearer $jwt'});
  }
}
