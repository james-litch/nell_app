import 'package:nell/core/base/base_view_model.dart';
import 'package:nell/core/constants/route_names.dart';
import 'package:nell/core/locator.dart';
import 'package:nell/core/models/user_model.dart';
import 'package:nell/core/services/navigator_service.dart';
import 'package:nell/core/services/storage_service.dart';

class HomeViewModel extends BaseViewModel {
  final NavigatorService _navigatorService = locator<NavigatorService>();
  final StorageService _storageService = locator<StorageService>();

  String _title;

  bool _menuOpen;

  bool _showTabs;

  int _currentTab;

  String _currentSubject; // id

  User _user;

  String _subject;

// want user ->
  // name email

// want subjects ->
  // name id exams(id name description) questions current question(id name description) dictionary
  HomeViewModel({
    String title = 'Nell',
    bool showTabs = false,
    int currentTab = 0,
    subject = 'booo',
    menuOpen = false,
  })  : this._title = title,
        this._menuOpen = menuOpen,
        this._showTabs = showTabs,
        this._subject = subject,
        this._currentTab = currentTab;

  Future init() async {
    _user = _storageService.user;
  }

  Future onAccount() async {
    _navigatorService.navigateTo(AccountViewRoute);
  }

  get showTabs => _showTabs;

  get currentTab => _currentTab;

  get subject => _subject;

  get title => this._title;

  get menuOpen => this._menuOpen;

  get user => this._user;

  set currentTab(int index) {
    this._currentTab = index;
    notifyListeners();
  }

  set title(String value) {
    this._title = value;
    notifyListeners();
  }

  set menuOpen(bool value) {
    this._menuOpen = value;
    notifyListeners();
  }

  set showTabs(bool value) {
    this._showTabs = value;
    notifyListeners();
  }

   set subject(String value) {
    this._subject = value;
    notifyListeners();
  }

}
