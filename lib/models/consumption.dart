class Consumption {
  double jan;
  double feb;
  double mar;
  double apr;
  double may;
  double jun;
  double jul;
  double aug;
  double sep;
  double oct;
  double nov;
  double dec;

  Consumption({
    this.jan = 0,
    this.feb = 0,
    this.mar = 0,
    this.apr = 0,
    this.may = 0,
    this.jun = 0,
    this.jul = 0,
    this.aug = 0,
    this.sep = 0,
    this.oct = 0,
    this.nov = 0,
    this.dec = 0,
  });

  getAnnual() {
    return (this.jan +
            this.feb +
            this.mar +
            this.apr +
            this.may +
            this.jun +
            this.jul +
            this.aug +
            this.sep +
            this.oct +
            this.nov +
            this.dec) /
        12;
  }

  factory Consumption.createConsumption(Map<String, dynamic> map) {
    return Consumption(
      jan: map['jan'] ?? 0,
      feb: map['feb'] ?? 0,
      mar: map['mar'] ?? 0,
      apr: map['apr'] ?? 0,
      may: map['may'] ?? 0,
      jun: map['jun'] ?? 0,
      jul: map['jul'] ?? 0,
      aug: map['aug'] ?? 0,
      sep: map['sep'] ?? 0,
      oct: map['oct'] ?? 0,
      nov: map['nov'] ?? 0,
      dec: map['dec'] ?? 0,
    );
  }
}
