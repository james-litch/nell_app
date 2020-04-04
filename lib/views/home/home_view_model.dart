import 'package:nell/core/base/base_view_model.dart';
import 'package:nell/core/constants/route_names.dart';
import 'package:nell/core/locator.dart';
import 'package:nell/core/models/question_model.dart';
import 'package:nell/core/models/subject_model.dart';
import 'package:nell/core/models/user_model.dart';
import 'package:nell/core/repositories/subject_repo.dart';
import 'package:nell/core/services/dialog_service.dart';
import 'package:nell/core/services/navigator_service.dart';
import 'package:nell/core/services/storage_service.dart';

class HomeViewModel extends BaseViewModel {
  final NavigatorService _navigatorService = locator<NavigatorService>();
  final DialogService _dialogService = locator<DialogService>();
  final StorageService _storageService = locator<StorageService>();
  final SubjectRepo subjectRepo = SubjectRepo();

  String _title;

  bool _menuOpen;

  bool _showTabs;

  int _currentTab;

  User _user;

  Subject _currentSubject;

  List<Subject> _subjects;

  String _dictionaryFilter;

  HomeViewModel({
    String title = 'Nell',
    bool showTabs = false,
    int currentTab = 0,
    String dictionaryFilter = "",
    menuOpen = false,
  })  : this._title = title,
        this._menuOpen = menuOpen,
        this._showTabs = showTabs,
        this._currentTab = currentTab,
        this._dictionaryFilter = dictionaryFilter;

  Future init() async {
    setBusy(true);
    _subjects = await subjectRepo.getSubjects();
    _user = _storageService.user;
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

  Future onQuestionClick(String questionId) async {
    List<Question> questions = await subjectRepo.getQuestion(
      subjectId: _currentSubject.id,
      questionId: questionId,
    );

    _navigatorService.navigateTo(AnswerQuestionsRoute, arguments: questions);
  }

  Future sendFeedback(String feedback) async {
    var res = await subjectRepo.sendFeedback(
        subjectId: _currentSubject.id, feedback: feedback);

    if (res)
      _currentSubject.feedback.add(feedback);
    else if (res is String)
      _dialogService.showDialog(
          buttonTitle: 'ok', title: "Feedback error", description: res);

    notifyListeners();
  }

  Future questionMenu(String value, int index) async {
    switch (value) {
      case 'REMOVE':
        {
          print('remove $index');
        }
        break;

      case 'DELETE':
        {
          print('delete $index');
        }
        break;

      case 'MAKE_CURRENT':
        {
          print('make_current $index');
        }
        break;
    }
  }

  Future examMenu(String value, index) async {
    switch (value) {
      case 'DELETE':
        {
          print('delete exam $index');
        }
        break;
    }
  }

   Future dictionaryMenu(String value, index) async {
    switch (value) {
      case 'DELETE':
        {
          print('delete definition $index');
        }
        break;
    }
  }

   Future userMenu(String value, index) async {
    switch (value) {
      case 'MAKE_ADMIN':
        {
          print('make user admin $index');
        }
        break;
    }
  }


  get showTabs => _showTabs;

  get currentTab => _currentTab;

  get subjects => _subjects;

  get title => this._title;

  get menuOpen => this._menuOpen;

  get user => this._user;

  get currentSubject => this._currentSubject;

  get dictionaryFilter => this._dictionaryFilter;

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

  set dictionaryFilter(String filter) {
    this._dictionaryFilter = filter;
    print(filter);
    notifyListeners();
  }
}
