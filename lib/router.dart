import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nell/views/account/account_view.dart';
import 'package:nell/views/auth/auth_view.dart';
import 'package:nell/views/home/home_view.dart';

import 'package:nell/core/constants/route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthViewRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: AuthView());

    case HomeViewRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: HomeView());

    case AccountViewRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: AccountView());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
