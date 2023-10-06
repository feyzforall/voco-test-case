import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localAuthRepositoryProvider = Provider<LocalAuthRepository>(
  (ref) => LocalAuthRepository(),
);

class LocalAuthRepository {
  static const String tokenKey = "token";

  static String? token;

  static bool get isLoggedIn => token != null;

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  Future<void> fetchToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString(tokenKey);
  }
}
