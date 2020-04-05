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

  Future editResources(String value, int index) async {
    switch (value) {
      case 'REMOVE_CURRENT_QUESTION':
        {
          log.i(
            'HOME MODEL: REMOVE_CURRENT_QUESTION ${_currentSubject.currentQuestions[index].question}',
          );

          var res = await subjectRepo.removeCurrentQuestion(
            subjectId: _currentSubject.id,
            questionId: _currentSubject.currentQuestions[index].id,
          );

          if (res) {
            _currentSubject.currentQuestions.removeAt(index);
            notifyListeners();
          } else {
            _dialogService.showDialog(
              title: 'Query Error',
              description: res,
              buttonTitle: 'ok',
            );
          }
        }
        break;

      case 'DELETE_QUESTION':
        {
          log.i(
            'HOME MODEL: DELETE_QUESTION ${_currentSubject.questions[index].question}',
          );
          var res = await subjectRepo.deleteQuestion(
            subjectId: _currentSubject.id,
            questionId: _currentSubject.questions[index].id,
          );

          if (res) {
            _currentSubject.currentQuestions.removeWhere((question) =>
                question.id == _currentSubject.questions[index].id);
            _currentSubject.questions.removeAt(index);
            notifyListeners();
          } else {
            _dialogService.showDialog(
              title: 'Query Error',
              description: res,
              buttonTitle: 'ok',
            );
          }
        }
        break;

      case 'MAKE_QUESTION_CURRENT':
        {
          log.i(
              'HOME MODEL: MAKE_QUESTION_CURRENT ${_currentSubject.questions[index].question}');
          var res = await subjectRepo.makeQuestionCurrent(
            subjectId: _currentSubject.id,
            questionId: _currentSubject.questions[index].id,
          );

          if (res) {
            _currentSubject.currentQuestions
                .add(_currentSubject.questions[index]);
            notifyListeners();
          } else {
            _dialogService.showDialog(
              title: 'Query Error',
              description: res,
              buttonTitle: 'ok',
            );
          }
        }
        break;

      case 'DELETE_EXAM':
        {
          log.i('HOME MODEL: DELETE_EXAM ${_currentSubject.exams[index].name}');

          var res = await subjectRepo.deleteExam(
            subjectId: _currentSubject.id,
            examId: _currentSubject.exams[index].id,
          );

          if (res is String) {
            _dialogService.showDialog(
              title: 'Query Error',
              description: res,
              buttonTitle: 'ok',
            );
          }
          _currentSubject.exams.removeAt(index);
          notifyListeners();
        }
        break;

      case 'MAKE_ADMIN':
        {
          log.i('HOME MODEL: MAKE_ADMIN ${_currentSubject.users[index].name}');
          var res = await subjectRepo.makeUserAdmin(
            subjectId: _currentSubject.id,
            userId: _currentSubject.users[index].id,
          );

          if (res is String) {
            _dialogService.showDialog(
              title: 'Query Error',
              description: res,
              buttonTitle: 'ok',
            );
          }
          _currentSubject.admins.add(_currentSubject.users[index]);
          _currentSubject.users.removeAt(index);
          notifyListeners();
        }
        break;

      case 'DELETE_DEFINITION':
        {
          log.i(
              'HOME MODEL: DELETE_DEFINITION ${_currentSubject.dictionary[index].phrase}');
          var res = await subjectRepo.deleteDefinition(
            subjectId: _currentSubject.id,
            definitionId: _currentSubject.dictionary[index].id,
          );

          if (res is String) {
            _dialogService.showDialog(
              title: 'Query Error',
              description: res,
              buttonTitle: 'ok',
            );
          }
          _currentSubject.dictionary.removeAt(index);
          notifyListeners();
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
