import 'package:flutter/foundation.dart';
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

    Map<String, dynamic> data = {
      'questions': questions,
      'subjectId': _currentSubject.id
    };
    _navigatorService.navigateTo(AnswerQuestionsRoute, arguments: data);
  }

  Future onExamClick(String examId) async {
    List<Question> questions = await subjectRepo.getExam(
      subjectId: _currentSubject.id,
      examId: examId,
    );

    Map<String, dynamic> data = {
      'questions': questions,
      'subjectId': _currentSubject.id
    };

    _navigatorService.navigateTo(AnswerQuestionsRoute, arguments: data);
  }

  Future joinSubject({
    @required String subjectId,
    @required String password,
  }) async {
    var res;

    if (subjectId == "" && password == "") {
      res = "Values must not be empty";
    } else {
      res = await subjectRepo.joinSubject(
          subjectId: subjectId, password: password);
    }

    if (res is String) {
      _dialogService.showDialog(
          buttonTitle: 'ok', title: "Query error", description: res);
    } else {
      _subjects.add(res);
      _currentSubject = _subjects.last;
      _title = _currentSubject.name;
      notifyListeners();
    }
  }

  Future createSubject({
    @required String subjectName,
    @required String password,
  }) async {
    var res;

    if (subjectName == "" && password == "") {
      res = "Values must not be empty";
    } else {
      res = await subjectRepo.createSubject(
        subjectName: subjectName,
        password: password,
      );
    }

    if (res is String) {
      _dialogService.showDialog(
          buttonTitle: 'ok', title: "Query error", description: res);
    } else {
      _subjects.add(res);
      _currentSubject = _subjects.last;
      _title = _currentSubject.name;
      _showTabs = true;
      notifyListeners();
    }
  }

  Future sendFeedback(String feedback) async {
    var res = await subjectRepo.sendFeedback(
        subjectId: _currentSubject.id, feedback: feedback);

    if (res is String) {
      _dialogService.showDialog(
          buttonTitle: 'ok', title: "Feedback error", description: res);
    } else {
      _currentSubject.feedback.add(feedback);
      notifyListeners();
    }
  }

  Future addDefinition({
    @required String phrase,
    @required String definition,
  }) async {
    var res;

    if (phrase == "" && definition == "") {
      res = "Values must not be empty";
    } else {
      res = await subjectRepo.addDefinition(
          phrase: phrase,
          definition: definition,
          subjectId: _currentSubject.id);
    }

    if (res is String) {
      _dialogService.showDialog(
          buttonTitle: 'ok', title: "Query error", description: res);
    } else {
      _currentSubject.dictionary.add(res);
      notifyListeners();
    }
  }

  Future addExam({
    @required String name,
    @required String description,
    @required List questions,
  }) async {
    var res;

    if (questions.length == 0 || name == '') {
      res = "Inputs can't be empty";
    } else {
      res = await subjectRepo.addExam(
        subjectId: _currentSubject.id,
        name: name,
        description: description,
        questions: questions,
      );
    }

    if (res is String) {
      _dialogService.showDialog(
          buttonTitle: 'ok', title: "Query error", description: res);
    } else {
      _currentSubject.exams.add(res);
      notifyListeners();
    }
  }

  Future addQuestion(List inputs) async {
    var res;
    if (inputs.contains("")) {
      res = 'Input fields must not be empty';
    } else {
      try {
        inputs.last = int.parse(inputs.last) - 1;
        if (inputs.last < 0 || inputs.last > inputs.length - 2) {
          res =
              'Correct Option must be an integer between 1 and ${inputs.length - 2}';
        }
      } catch (e) {
        res =
            'Correct Option must be an integer between 1 and ${inputs.length - 2}';
      }

      res = await subjectRepo.addQuestion(
        subjectId: _currentSubject.id,
        question: inputs[0],
        answers: inputs.sublist(1, inputs.length - 1),
        correctAnswer: inputs.last,
      );
    }

    if (res is String) {
      _dialogService.showDialog(
          buttonTitle: 'ok', title: "Query error", description: res);
    } else {
      _currentSubject.questions.add(res);
      notifyListeners();
    }
  }

  Future editResources(String value, [int index]) async {
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

          if (res is String) {
            _dialogService.showDialog(
              title: 'Query Error',
              description: res,
              buttonTitle: 'ok',
            );
          } else {
            _currentSubject.currentQuestions.removeAt(index);
            notifyListeners();
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

          if (res is String) {
            _dialogService.showDialog(
              title: 'Query Error',
              description: res,
              buttonTitle: 'ok',
            );
          } else {
            _currentSubject.currentQuestions.removeWhere((question) =>
                question.id == _currentSubject.questions[index].id);
            _currentSubject.questions.removeAt(index);
            notifyListeners();
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

          if (res is String) {
            _dialogService.showDialog(
              title: 'Query Error',
              description: res,
              buttonTitle: 'ok',
            );
          } else {
            _currentSubject.currentQuestions
                .add(_currentSubject.questions[index]);
            notifyListeners();
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
          } else {
            _currentSubject.exams.removeAt(index);
            notifyListeners();
          }
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
          } else {
            _currentSubject.admins.add(_currentSubject.users[index]);
            _currentSubject.users.removeAt(index);
            notifyListeners();
          }
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
          } else {
            _currentSubject.dictionary.removeAt(index);
            notifyListeners();
          }
        }
        break;

      case 'DELETE_SUBJECT':
        {
          log.i('HOME MODEL: DELETE_SUBJECT ${_subjects[index].name}');

          var res = subjectRepo.deleteSubject(
            subjectId: _subjects[index].id,
          );

          if (res is String) {
            _dialogService.showDialog(
              title: 'Query Error',
              description: 'CHANGE',
              buttonTitle: 'ok',
            );
          } else {
            _subjects.removeAt(index);

            notifyListeners();
          }
        }
        break;

      case 'LEAVE_SUBJECT':
        {
          log.i('HOME MODEL: LEAVE_SUBJECT ${_subjects[index].name}');

          var res = subjectRepo.leaveSubject(
            subjectId: _subjects[index].id,
          );

          if (res is String) {
            _dialogService.showDialog(
              title: 'Query Error',
              description: 'CHANGE',
              buttonTitle: 'ok',
            );
          } else {
            _subjects.removeAt(index);
            notifyListeners();
          }
        }
        break;

      case 'CLEAR_FEEDBACK':
        {
          log.i('HOME MODEL: CLEAR_FEEDBACK ${_currentSubject.name}');

          var res = await subjectRepo.clearFeedback(
            subjectId: _currentSubject.id,
          );

          if (res is String) {
            _dialogService.showDialog(
              title: 'Query Error',
              description: 'CHANGE',
              buttonTitle: 'ok',
            );
          } else {
            _currentSubject.feedback.clear();
            notifyListeners();
          }
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

  get dictionary {
    return dictionaryFilter == ''
        ? this._currentSubject.dictionary
        : this
            ._currentSubject
            .dictionary
            .where((def) => def.phrase.toLowerCase().contains(dictionaryFilter))
            .toList();
  }

  set currentTab(int index) {
    _dictionaryFilter = '';
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
    _dictionaryFilter = '';
    this._currentSubject = _subjects[value];
    notifyListeners();
  }

  set dictionaryFilter(String filter) {
    this._dictionaryFilter = filter;
    notifyListeners();
  }
}
