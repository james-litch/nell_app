import 'package:nell/core/base/base_view_model.dart';
import 'package:nell/core/constants/route_names.dart';
import 'package:nell/core/locator.dart';
import 'package:nell/core/services/auth_service.dart';
import 'package:nell/core/services/navigator_service.dart';

class StartupViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigatorService _navigatorService = locator<NavigatorService>();

  Future startUpLogic() async {
    var userLoggedIn = _authService.userLoggedIn();
    print(userLoggedIn);
    Future.delayed(const Duration(seconds: 1), () {
      if (userLoggedIn)
        _navigatorService.navigateToAndReplace(HomeViewRoute);
      else
        _navigatorService.navigateToAndReplace(AuthViewRoute);
    });
  }
}
