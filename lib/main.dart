import 'package:nell/router.dart';
import 'package:nell/views/startup/startup_view.dart';

import 'core/locator.dart';
import 'core/managers/dialog_manager.dart';
import 'core/providers.dart';
import 'core/services/dialog_service.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocatorInjector.setupLocator();
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: MaterialApp(
        builder: (context, child) => Navigator(
          key: locator<DialogService>().dialogNavigationKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => DialogManager(child: child)),
        ),
        navigatorKey: locator<NavigatorService>().navigatorKey,
        theme: ThemeData(primaryColor: Colors.blue),
        home: StartupView(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
