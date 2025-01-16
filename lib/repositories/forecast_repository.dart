import 'package:ifes_solar/infra/api.dart';

class ForecastRepository {
  final SolcastApi api;

  ForecastRepository({required this.api});

  Future getForecast(double latitude, double longitude) async {
    return await this.api.get(
        '/world_radiation/forecasts?latitude=${latitude}&longitude=${longitude}&format=json');
  }
}
