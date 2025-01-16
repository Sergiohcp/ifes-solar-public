import 'package:ifes_solar/models/panel.dart';

getGeneratedEnergy(
    {required double incidence, required Panel panel, required double area}) {
  final int numPanels = (area / panel.area).ceil();

  final conditioningUnitEfficiency = 0.98;
  final naturalTemperature = 25;
  final energy = (incidence * 3.6 / 3600) *
      area *
      (panel.efficiency / 100) *
      (1 + (panel.ptc * (panel.temperature - naturalTemperature) / 100)) *
      conditioningUnitEfficiency;
  return energy * numPanels;
}
