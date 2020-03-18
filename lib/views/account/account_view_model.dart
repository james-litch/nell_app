

import 'package:nell/core/base/base_view_model.dart';
import 'package:nell/core/constants/route_names.dart';
import 'package:nell/core/locator.dart';
import 'package:nell/core/services/navigator_service.dart';
import 'package:nell/core/services/storage_service.dart';

class AccountViewModel extends BaseViewModel {
  StorageService _storageService = locator<StorageService>();
  NavigatorService _navigatorService = locator<NavigatorService>();
  AccountViewModel();
  
  // Add ViewModel specific code here

  Future logout() async {
    _storageService.logOut();
    _navigatorService.navigateToAndReplace(AuthViewRoute);

  }
}