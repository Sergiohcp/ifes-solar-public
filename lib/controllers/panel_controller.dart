import 'dart:convert';

import 'package:get/get.dart';
import 'package:ifes_solar/models/list_panel.dart';
import 'package:ifes_solar/models/panel.dart';
import 'package:ifes_solar/repositories/panel_repository.dart';

class PanelController {
  final PanelRepository panelRepository;
  final _panels = [].obs;
  var _isPanelsLoading = false.obs;

  PanelController({required this.panelRepository});

  List<dynamic> get panels => _panels.value;

  bool get isPanelsLoading => _isPanelsLoading.value;

  void setPanels(List<Panel> value) {
    _panels.value = value;
  }

  void setPanelsLoading(bool value) {
    _isPanelsLoading.value = value;
  }

  Future getPanels() async {
    try {
      setPanelsLoading(true);
      var response = await this.panelRepository.getPanels();
      if (response.body != null) {
        var body = jsonDecode(response.body);
        final List<Panel> panels = ListPanel.createListPanel(
            List<Map<String, dynamic>>.from(body['data']));
        setPanels(panels);
      }
    } finally {
      setPanelsLoading(false);
    }
  }
}
