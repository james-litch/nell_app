import 'package:nell/core/base/base_view_model.dart';
import 'package:nell/core/constants/route_names.dart';
import 'package:nell/core/locator.dart';
import 'package:nell/core/services/navigator_service.dart';
import 'package:nell/core/services/storage_service.dart';

class StartupViewModel extends BaseViewModel {
  NavigatorService _navigatorService = locator<NavigatorService>();
  StorageService _storageService = locator<StorageService>();

  Future startUpLogic() async {
    var userLoggedIn = _storageService.tokens;

    Future.delayed(const Duration(seconds: 1), () {
      if (userLoggedIn != null)
        _navigatorService.navigateToAndReplace(HomeViewRoute);
      else
        _navigatorService.navigateToAndReplace(AuthViewRoute);
    });
  }
}
