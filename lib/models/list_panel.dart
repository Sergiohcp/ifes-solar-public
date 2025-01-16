import 'package:ifes_solar/models/panel.dart';

class ListPanel {
  static createListPanel(List<Map<String, dynamic>> items) {
    return List<Panel>.from(items.map((item) => Panel.createPanel(item)));
  }
}
