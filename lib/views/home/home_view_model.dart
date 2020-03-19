import 'package:nell/core/base/base_view_model.dart';
import 'package:nell/core/constants/route_names.dart';
import 'package:nell/core/locator.dart';
import 'package:nell/core/services/navigator_service.dart';

class HomeViewModel extends BaseViewModel {
  final NavigatorService _navigatorService = locator<NavigatorService>();

  String _title;

  //List <Subject>

  // menu items -> subject; name id
  // on subject change : subjects

  HomeViewModel({String title = 'Nell'}) : this._title = title;

  Future init() async {
    // get subjects.
  }

  // get items .map .where

  String get title => this._title;

  set title(String value) {
    this._title = value;
    notifyListeners();
  }

  Future onAccount() async {
    _navigatorService.navigateTo(AccountViewRoute);
  }
}
