import 'package:shared_preferences/shared_preferences.dart';

class Jwt {
  static Future<String?> getJwtToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jwtToken = prefs.getString('jwtToken');
    return jwtToken;
  }

  static Future<void> setJwtToken(String jwtToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwtToken', jwtToken);
  }
}
