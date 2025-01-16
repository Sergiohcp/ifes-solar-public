import 'package:ifes_solar/models/energy.dart';

class UserSimulation {
  int id;
  String userEmail;
  String date;
  String title;
  String panel;
  String area;
  String location;
  Energy userEnergy;
  Energy panelEnergy;

  UserSimulation({
    this.id = 0,
    this.userEmail = "",
    this.date = "",
    this.title = "",
    this.panel = "",
    this.area = "",
    this.location = "",
    this.userEnergy = const Energy(),
    this.panelEnergy = const Energy(),
  });

  factory UserSimulation.createUserSimulation(Map<String, dynamic> map) {
    return UserSimulation(
      id: map?['id'] ?? 0,
      userEmail: map?['attributes']?['user_email'] ?? "",
      date: map?['attributes']?['date'] ?? "",
      title: map?['attributes']?['title'] ?? "",
      panel: map?['attributes']?['panel'] ?? "",
      area: map?['attributes']?['area'] ?? "",
      location: map?['attributes']?['location'] ?? "",
      userEnergy: map?['attributes']?['user_energy'] != null
          ? Energy.createEnergy({
              'jan': map['attributes']['user_energy']['jan'],
              'feb': map['attributes']['user_energy']['feb'],
              'mar': map['attributes']['user_energy']['mar'],
              'apr': map['attributes']['user_energy']['apr'],
              'may': map['attributes']['user_energy']['may'],
              'jun': map['attributes']['user_energy']['jun'],
              'jul': map['attributes']['user_energy']['jul'],
              'aug': map['attributes']['user_energy']['aug'],
              'sep': map['attributes']['user_energy']['sep'],
              'oct': map['attributes']['user_energy']['oct'],
              'nov': map['attributes']['user_energy']['nov'],
              'dec': map['attributes']['user_energy']['dec'],
              'annual': map['attributes']['user_energy']['annual'],
            })
          : Energy(),
      panelEnergy: map?['attributes']?['panel_energy'] != null
          ? Energy.createEnergy({
              'jan': map['attributes']['panel_energy']['jan'],
              'feb': map['attributes']['panel_energy']['feb'],
              'mar': map['attributes']['panel_energy']['mar'],
              'apr': map['attributes']['panel_energy']['apr'],
              'may': map['attributes']['panel_energy']['may'],
              'jun': map['attributes']['panel_energy']['jun'],
              'jul': map['attributes']['panel_energy']['jul'],
              'aug': map['attributes']['panel_energy']['aug'],
              'sep': map['attributes']['panel_energy']['sep'],
              'oct': map['attributes']['panel_energy']['oct'],
              'nov': map['attributes']['panel_energy']['nov'],
              'dec': map['attributes']['panel_energy']['dec'],
              'annual': map['attributes']['panel_energy']['annual'],
            })
          : Energy(),
    );
  }
}
