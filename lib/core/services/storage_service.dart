import 'dart:convert';

import 'package:nell/core/models/token_model.dart';
import 'package:nell/core/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/base/base_service.dart';

class StorageService extends BaseService {
  static StorageService _instance;
  static SharedPreferences _preferences;

  static const String UserKey = 'USER';
  static const String SubjectsKey = 'SUBJECTS';
  static const String TokensKey = 'AUTH_TOKENS';
  static const String LoggedIn = 'LOGGED_IN';

  static Future<StorageService> getInstance() async {
    if (_instance == null) {
      _instance = StorageService();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  bool get loggedIn => _getFromDisk(LoggedIn) ?? false;

  set loggedIn(bool value) => _saveToDisk(LoggedIn, value);

  User get user {
    var userJson = _getFromDisk(UserKey);
    if (userJson == null) return null;
    return User.fromJson(json.decode(userJson));
  }

  Tokens get tokens {
    var tokenJson = _getFromDisk(TokensKey);

    if (tokenJson == null) return null;

    return Tokens.fromJson(json.decode(tokenJson));
  }

  set user(User userToSave) =>
      _saveToDisk(UserKey, json.encode(userToSave.toJson()));

  set tokens(Tokens tokensToSave) =>
      _saveToDisk(TokensKey, json.encode(tokensToSave.toJson()));

  void _saveToDisk<T>(String key, T content) {
    log.i('StorageService: _saveToDisk. key: $key value: $content');

    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  dynamic _getFromDisk(String key) {
    var value;
    try {
      value = _preferences.get(key);
      log.i('StorageService: _getFromDisk. key: $key value: $value');
    } catch (err) {
      value = null;
    }
    return value;
  }

  Future logOut() async {
    await _preferences.clear();
  }
}
