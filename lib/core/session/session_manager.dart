import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../domain/model/user.dart';

class SessionManager {
  final GetStorage _storage;

  SessionManager() : _storage = GetStorage();

  bool isLogin() => _storage.read(SessionKey.SESSION_USER_TOKEN.name) != null;

  bool isFreshInstall() => _storage.read(SessionKey.FRESH_INSTALL.name) ?? true;

  bool isAlreadyRegister() =>
      _storage.read(SessionKey.SESSION_USER.name) != null &&
      !isFreshInstall() &&
      _storage.read(SessionKey.SESSION_USER_TOKEN.name) == null;

  String? token() {
    if (isLogin()) {
      return _storage.read(SessionKey.SESSION_USER_TOKEN.name);
    } else {
      return _storage.read(SessionKey.SESSION_APP_TOKEN.name);
    }
  }

  User? user() {
    final data = _storage.read(SessionKey.SESSION_USER.name);
    return data != null ? User.fromJson(json.decode(data)) : null;
  }

  void setUser(User user) async {
    _storage.write(SessionKey.SESSION_USER.name, json.encode(user));
  }

  void setLogin(String token) async {
    _storage.write(SessionKey.FRESH_INSTALL.name, false);
    _storage.write(SessionKey.SESSION_USER_TOKEN.name, token);
  }

  void setUserToken(String token) async {
    _storage.write(SessionKey.SESSION_USER_TOKEN.name, token);
  }

  void setAppToken(String token) async {
    _storage.write(SessionKey.SESSION_APP_TOKEN.name, token);
  }

  Future<void> logout() async {
    // rewrite token with app token
    await _storage.remove(SessionKey.SESSION_USER_TOKEN.name);
    await _storage.remove(SessionKey.SESSION_USER.name);
  }

  clear() async {
    await _storage.erase();
  }
}

enum SessionKey {
  SESSION_USER,
  SESSION_USER_TOKEN,
  SESSION_APP_TOKEN,
  SESSION_READ_SETTING,
  SESSION_LANG_ID,
  SESSION_LANG_COUNTRY_ID,
  FRESH_INSTALL
}
