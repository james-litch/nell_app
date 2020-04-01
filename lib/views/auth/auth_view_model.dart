import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nell/core/base/base_view_model.dart';
import 'package:nell/core/constants/route_names.dart';
import 'package:nell/core/locator.dart';
import 'package:nell/core/services/auth_service.dart';
import 'package:nell/core/services/dialog_service.dart';
import 'package:nell/core/services/navigator_service.dart';

class AuthViewModel extends BaseViewModel {
  AuthService _authService = locator<AuthService>();
  DialogService _dialogService = locator<DialogService>();

  Future logIn({@required String email, @required String password}) async {
    setBusy(true);

    var body = {
      "query": signInMutation,
      "variables": {
        "input": {
          "email": email,
          "password": password,
        }
      },
    };

    var result = await _authService.logIn(json.encode(body));

    setBusy(false);
    if (result is String) {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    } else {
      locator<NavigatorService>().navigateToAndReplace(HomeViewRoute);
    }
  }

  Future signUp({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var body = {
      "query": signUpMutation,
      "variables": {
        "input": {
          "name": name,
          "email": email,
          "password": password,
        }
      },
    };

    var result = await _authService.logIn(json.encode(body));
    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    } else {
      locator<NavigatorService>().navigateToAndReplace(HomeViewRoute);
    }
  }

  String signInMutation = """
  mutation SignIn(\$input: SignIn) {
     signIn(input: \$input) {
    tokens {
      refreshToken
      accessToken
    }
    user {
      id
      name
      email
      subjects{
        subject{
          name
          id
        }
      }
    }
  }
  }
""";

  String signUpMutation = """
  mutation SignUp(\$input: SignUp) {
     signIn(input: \$input) {
    tokens {
      refreshToken
      accessToken
    }
    user {
      name
      email
      subjects{
        subject{
          name
          id
        }
      }
    }
  }
  }
""";
}
