class EnergyPoint {
  final double x;
  final double y;

  EnergyPoint({required this.x, required this.y});
}

class Energy {
  final double jan;
  final double feb;
  final double mar;
  final double apr;
  final double may;
  final double jun;
  final double jul;
  final double aug;
  final double sep;
  final double oct;
  final double nov;
  final double dec;
  final double annual;

  const Energy({
    this.jan = 0.0,
    this.feb = 0.0,
    this.mar = 0.0,
    this.apr = 0.0,
    this.may = 0.0,
    this.jun = 0.0,
    this.jul = 0.0,
    this.aug = 0.0,
    this.sep = 0.0,
    this.oct = 0.0,
    this.nov = 0.0,
    this.dec = 0.0,
    this.annual = 0.0,
  });

  toFixed(double value) {
    return double.parse(value.toStringAsFixed(2));
  }

  List<EnergyPoint> toPoints() {
    final List<EnergyPoint> energyPoints = <EnergyPoint>[
      EnergyPoint(x: 1, y: this.toFixed(this.jan)),
      EnergyPoint(x: 2, y: this.toFixed(this.feb)),
      EnergyPoint(x: 3, y: this.toFixed(this.mar)),
      EnergyPoint(x: 4, y: this.toFixed(this.apr)),
      EnergyPoint(x: 5, y: this.toFixed(this.may)),
      EnergyPoint(x: 6, y: this.toFixed(this.jun)),
      EnergyPoint(x: 7, y: this.toFixed(this.jul)),
      EnergyPoint(x: 8, y: this.toFixed(this.aug)),
      EnergyPoint(x: 9, y: this.toFixed(this.sep)),
      EnergyPoint(x: 10, y: this.toFixed(this.oct)),
      EnergyPoint(x: 11, y: this.toFixed(this.nov)),
      EnergyPoint(x: 12, y: this.toFixed(this.dec))
    ];

    return energyPoints;
  }

  factory Energy.createEnergy(Map<String, dynamic> map) {
    return Energy(
      jan: map?['jan'] != null ? map['jan']!.toDouble() : 0.0,
      feb: map?['feb'] != null ? map['feb']!.toDouble() : 0.0,
      mar: map?['mar'] != null ? map['mar']!.toDouble() : 0.0,
      apr: map?['apr'] != null ? map['apr']!.toDouble() : 0.0,
      may: map?['may'] != null ? map['may']!.toDouble() : 0.0,
      jun: map?['jun'] != null ? map['jun']!.toDouble() : 0.0,
      jul: map?['jul'] != null ? map['jul']!.toDouble() : 0.0,
      aug: map?['aug'] != null ? map['aug']!.toDouble() : 0.0,
      sep: map?['sep'] != null ? map['sep']!.toDouble() : 0.0,
      oct: map?['oct'] != null ? map['oct']!.toDouble() : 0.0,
      nov: map?['nov'] != null ? map['nov']!.toDouble() : 0.0,
      dec: map?['dec'] != null ? map['dec']!.toDouble() : 0.0,
      annual: map?['annual'] != null ? map['annual']!.toDouble() : 0.0,
    );
  }
}
