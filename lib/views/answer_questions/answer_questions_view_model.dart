import 'package:flutter/foundation.dart';
import 'package:nell/core/base/base_view_model.dart';
import 'package:nell/core/locator.dart';
import 'package:nell/core/models/question_model.dart';
import 'package:nell/core/models/user_model.dart';
import 'package:nell/core/repositories/subject_repo.dart';
import 'package:nell/core/services/dialog_service.dart';

import 'package:nell/core/services/storage_service.dart';

class AnswerQuestionsViewModel extends BaseViewModel {
  final StorageService _storageService = locator<StorageService>();
  final DialogService _dialogService = locator<DialogService>();
  final SubjectRepo subjectRepo = SubjectRepo();
  final String _subjectId;
  final List _chosenAnswers;
  final bool _isExam;
  List<Question> _questions;
  User _user;
  bool _isFinished;
  int _questionsIndex;

  AnswerQuestionsViewModel({
    @required questions,
    @required subjectId,
    questionsIndex = 0,
    isFinished = false,
  })  : this._questions = questions,
        this._subjectId = subjectId,
        this._chosenAnswers = List(questions.length),
        this._isFinished = isFinished,
        this._isExam = questions.length > 1 ? true : false,
        this._questionsIndex = questionsIndex;

  Future init() async {
    _user = _storageService.user;
    if (!_isExam) {
      List users = _questions[0].answeredBy;

      var completedUser =
          users.firstWhere((user) => user.id == _user.id, orElse: () => null);

      _isFinished = completedUser == null ? false : true;
    }
  }

  Future answerQuestion() async {
    var res;

    if (_chosenAnswers[_questionsIndex] == null) return;

    if (_questionsIndex == _questions.length - 1) {
      res = isExam
          ? true
          : await subjectRepo.answerQuestion(
              subjectId: _subjectId,
              questionId: _questions[0].id,
              answer: _chosenAnswers[0],
            );

      if (res is String) {
        _dialogService.showDialog(
            buttonTitle: 'ok', title: "Query error", description: res);
      } else {
        _questions = isExam ? _questions : res;
        _isFinished = true;
        notifyListeners();
      }
    } else {
      _questionsIndex++;
      notifyListeners();
      return;
    }
  }

  get questionNumber => '${_questionsIndex + 1} / ${_questions.length}';

  get question => _questions[_questionsIndex].question;

  get questions => _questions;

  get answers => _questions[_questionsIndex].answers;

  get buttonText =>
      _questionsIndex == _questions.length - 1 ? 'Submit' : 'Next';

  get chosenAnswer => _chosenAnswers[_questionsIndex];

  get chosenAnswers => _chosenAnswers;

  get isFinished => _isFinished;

  get type => _isExam ? 'Exam' : "Question";

  get isExam => _isExam;

  set answer(int answer) {
    _chosenAnswers[_questionsIndex] = answer;
    notifyListeners();
  }
}
