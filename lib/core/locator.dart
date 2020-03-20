import 'package:nell/core/services/api_service.dart';
import 'package:nell/core/services/auth_service.dart';
import 'package:nell/core/services/dialog_service.dart';
import 'package:nell/core/services/storage_service.dart';

import '../core/logger.dart';
import '../core/services/navigator_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt locator = GetIt.instance;

class LocatorInjector {
  static Logger _log = getLogger('LocatorInjector');

  static Future<void> setupLocator() async {
    _log.d('Initializing Storage Service');
    var instance = await StorageService.getInstance();
    locator.registerSingleton<StorageService>(instance);

    _log.d('Initializing Navigator Service');
    locator.registerLazySingleton(() => NavigatorService());

    _log.d('Initializing Dialog Service');
    locator.registerLazySingleton(() => DialogService());

    _log.d('Initializing Auth Service');
    locator.registerLazySingleton(() => AuthService());

    _log.d('Initializing API Service');
    locator.registerLazySingleton(() => ApiService());
  }
}
