import 'package:shared_preferences/shared_preferences.dart';

class SharepreferencesUserData {
  static setRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("ROLE", role);
  }

  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("ROLE");
  }
}
