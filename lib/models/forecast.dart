class ForecastData {
  final String date;
  final double energy;
  final double x;

  ForecastData({required this.date, required this.energy, required this.x});
}

class Forecast {
  List<ForecastData> forecastDataList = [];

  Forecast({required this.forecastDataList});

  factory Forecast.createForecast(List<Map<String, dynamic>> items) {
    final List<ForecastData> forecastData = [];
    var count = 0.0;
    for (var i = 0; i < items.length; i++) {
      final dateSplitted = items[i]['date'].split(" ");
      final hourSplitted = dateSplitted[1].split(":");
      if (hourSplitted[1] == '00') {
        forecastData.add(ForecastData(
            date: items[i]['date'], energy: items[i]['energy'], x: count));
        count += 10;
      }
    }

    return Forecast(forecastDataList: forecastData.toList());
  }
}
