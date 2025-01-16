import 'dart:convert';

import 'package:get/get.dart';
import 'package:ifes_solar/models/jwt.dart';
import 'package:ifes_solar/repositories/auth_repository.dart';
import 'package:ifes_solar/utils/toaster.dart';
import 'package:ifes_solar/utils/user_reset.dart';

class AuthController {
  final AuthRepository authRepository;
  var _isAuthLoading = false.obs;

  AuthController({required this.authRepository});

  bool get isAuthLoading => _isAuthLoading.value;

  void setAuthLoading(bool value) {
    _isAuthLoading.value = value;
  }

  Future register(String username, String email, String password) async {
    try {
      setAuthLoading(true);
      var response =
          await this.authRepository.register(username, email, password);
      if (response.body != null) {
        var body = jsonDecode(response.body);
        Jwt.setJwtToken(body['jwt']);
        Get.offNamed('/Home');
      }
    } catch (error) {
      showToaster(
          title: "Ops!",
          message: "Ocorreu um erro ao realizar o cadastro. Tente novamente.");
    } finally {
      setAuthLoading(false);
    }
  }

  Future login(String email, String password) async {
    try {
      setAuthLoading(true);
      var response = await this.authRepository.login(email, password);
      if (response.body != null) {
        var body = jsonDecode(response.body);
        Jwt.setJwtToken(body['jwt']);
        Get.offNamed('/Home');
      }
    } catch (error) {
      showToaster(
          title: "Ops!",
          message: "Ocorreu um erro ao realizar o login. Tente novamente.");
    } finally {
      setAuthLoading(false);
    }
  }

  Future logout() async {
    userReset();
  }
}
