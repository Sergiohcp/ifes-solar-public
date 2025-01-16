import 'package:get/get.dart';
import 'package:ifes_solar/models/jwt.dart';

void userReset() {
  Jwt.setJwtToken("");
  Get.offNamed('/Login');
}
