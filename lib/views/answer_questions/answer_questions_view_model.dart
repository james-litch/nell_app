import 'package:flutter/foundation.dart';
import 'package:nell/core/base/base_view_model.dart';
import 'package:nell/core/models/question_model.dart';

class AnswerQuestionsViewModel extends BaseViewModel {
  final List<Question> _questions;
  final int _questionsIndex;
  final List _chosenAnswers;

  AnswerQuestionsViewModel(
      {@required questions, questionsIndex = 0})
      : this._questions = questions,
        this._chosenAnswers = List(questions.length),
        this._questionsIndex = questionsIndex;

  get questionNumber => '${_questionsIndex + 1} / ${_questions.length}';

  get question => _questions[_questionsIndex].question;

  get answers => _questions[_questionsIndex].answers;

  get buttonText =>
      _questionsIndex == _questions.length - 1 ? 'Submit' : 'Next';

  get chosenAnswer => _chosenAnswers[_questionsIndex];

  set answerQuestion(int answer) {
    _chosenAnswers[_questionsIndex] = answer;
    notifyListeners();
  }
}
