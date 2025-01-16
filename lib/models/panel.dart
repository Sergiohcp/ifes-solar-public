class Panel {
  int id;
  String image;
  String producer;
  String name;
  double power;
  double temperature;
  double area;
  double efficiency;
  double ptc;
  String datasheet;

  Panel(
      {this.id = 0,
      this.image = "",
      this.producer = "",
      this.name = "",
      this.power = 0,
      this.temperature = 0,
      this.area = 0,
      this.efficiency = 0,
      this.ptc = 0,
      this.datasheet = ""});

  factory Panel.createPanel(Map<String, dynamic> map) {
    return Panel(
      id: map['id'] ?? 0,
      image: map['producer_image'] ?? "",
      producer: map['producer'] ?? "",
      name: map['name'] ?? "",
      power: map['power'].toDouble() ?? 0,
      temperature: map['temperature'].toDouble() ?? 0,
      area: map['area'].toDouble() ?? 0,
      efficiency: map['efficiency'].toDouble() ?? 0,
      ptc: map['ptc'] ?? 0,
      datasheet: map['datasheet'] ?? "",
    );
  }
}
