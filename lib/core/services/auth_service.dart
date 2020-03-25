import 'dart:convert';

import 'package:nell/core/base/base_service.dart';
import 'package:http/http.dart' as http;
import 'package:nell/core/constants/api_constants.dart';
import 'package:nell/core/models/token_model.dart';
import 'package:nell/core/models/user_model.dart';
import 'package:nell/core/services/storage_service.dart';

import '../locator.dart';

class AuthService extends BaseService {
  final StorageService _storageService = locator<StorageService>();
  Future logIn(String body) async {
    var response = await http.post(
      apiEndpoint,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    var resBody = json.decode(response.body);

    if (resBody['errors'] != null) return (resBody['errors'][0]['message']);

    var data = resBody['data']['signIn'] != null
        ? resBody['data']['signIn']
        : resBody['data']['signUp'];

    Tokens tokens = Tokens.fromJson(data['tokens']);

    _storageService.tokens = tokens;

    User user = User.fromJson(data['user']);
    _storageService.user = user;

    return true;
  }

  Future logOut() => _storageService.logOut();

  bool userLoggedIn() => _storageService.tokens != null;
}
