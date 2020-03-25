import 'package:nell/core/base/base_view_model.dart';
import 'package:nell/core/constants/route_names.dart';
import 'package:nell/core/locator.dart';
import 'package:nell/core/models/subject_model.dart';
import 'package:nell/core/models/user_model.dart';
import 'package:nell/core/repositories/subject_repo.dart';
import 'package:nell/core/services/api_service.dart';
import 'package:nell/core/services/navigator_service.dart';
import 'package:nell/core/services/storage_service.dart';

class HomeViewModel extends BaseViewModel {
  final NavigatorService _navigatorService = locator<NavigatorService>();
  final StorageService _storageService = locator<StorageService>();
  final ApiService _apiService = locator<ApiService>();
  final SubjectRepo subjectRepo = SubjectRepo();

  String _title;

  bool _menuOpen;

  bool _showTabs;

  int _currentTab;

  User _user;

  Subject _currentSubject;

  List<Subject> _subjects;

// want subjects ->
  // name id exams(id name description) questions current question(id name description) dictionary
  HomeViewModel({
    String title = 'Nell',
    bool showTabs = false,
    int currentTab = 0,
    menuOpen = false,
  })  : this._title = title,
        this._menuOpen = menuOpen,
        this._showTabs = showTabs,
        this._currentTab = currentTab;

  Future init() async {
    setBusy(true);
    _user = _storageService.user;
    _subjects = await subjectRepo.getSubjects();
    setBusy(false);
    notifyListeners();
  }

  Future refreshPage() async {
    setBusy(true);
    _subjects = await subjectRepo.getSubjects();
    setBusy(false);
    notifyListeners();
  }

  Future onAccount() async {
    _navigatorService.navigateTo(AccountViewRoute);
  }

  get showTabs => _showTabs;

  get currentTab => _currentTab;

  get subjects => _subjects;

  get title => this._title;

  get menuOpen => this._menuOpen;

  get user => this._user;

  get currentSubject => this._currentSubject;

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

  set currentSubject(int value) {
    this._currentSubject = _subjects[value];
    notifyListeners();
  }

  String homePageQuery = '''
    query {
      me {
        name
        subjects{
          admin
          subject{
            name
            id
          }
       }
    }
  ''';
}
