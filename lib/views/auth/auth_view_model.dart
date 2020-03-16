import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nell/core/base/base_view_model.dart';
import 'package:nell/core/constants/route_names.dart';
import 'package:nell/core/locator.dart';
import 'package:nell/core/services/auth_service.dart';
import 'package:nell/core/services/dialog_service.dart';
import 'package:nell/core/services/navigator_service.dart';
import 'package:nell/views/home/home_view.dart';

class AuthViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();

  Future logIn(String email, String password) async {
    var body = {
      "query": signInMutation,
      "variables": {
        "input": {"email": email, "password": password}
      },
    };

    var result = await _authService.logIn(json.encode(body));

    if (result is String) {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    } else {
      locator<NavigatorService>().navigateToAndReplace(HomeViewRoute);
    }
  }

  Future signUp(String name, String email, String password) async {
    var body = {
      "query": signUpMutation,
      "variables": {
        "input": {"name": name, "email": email, "password": password}
      },
    };

    var result = await _authService.logIn(json.encode(body));

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
      name
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
