import '../../core/base/base_service.dart';
import 'package:flutter/material.dart';

class NavigatorService extends BaseService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    log.i('navigateToPageWithReplacement: pageRoute: $routeName');
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

   Future<dynamic> navigateToAndReplace(String routeName, {dynamic arguments}) {
    log.i('navigateToPageWithReplacement: pageRoute: $routeName');
    return navigatorKey.currentState.pushReplacementNamed(routeName, arguments: arguments);
  }

  void pop<T>([T result]) {
    log.i('goBack:');
    if (navigatorKey.currentState == null) {
      log.e('goBack: Navigator State is null');
      return;
    }
    navigatorKey.currentState.pop(result);
  }
}
