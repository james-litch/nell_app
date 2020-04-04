import 'package:nell/core/models/user_model.dart';

class Question {
  final String id;
  final String question;
  final int correctAnswer;
  final List<Answer> answers;
  final List<User> answeredBy;

  Question(
      {this.id,
      this.question,
      this.correctAnswer,
      this.answers,
      this.answeredBy});

  factory Question.fromJson(Map<String, dynamic> json) {
    List<Answer> answerList = json['answers'] != null
        ? (json['answers'] as List).map((i) => Answer.fromJson(i)).toList()
        : null;

    List<User> answeredByList = json['answeredBy'] != null
        ? (json['answeredBy'] as List).map((i) => User.fromJson(i)).toList()
        : null;

    int correctAnswer = json['correctAnswer'] !=null ? int.parse(json['correctAnswer']) : null;

    return Question(
      id: json['id'],
      question: json['question'],
      correctAnswer: correctAnswer,
      answers: answerList,
      answeredBy: answeredByList,
    );
  }
}

class Answer {
  final String answer;
  final int totalChosen;

  Answer({this.answer, this.totalChosen});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      answer: json['answer'],
      totalChosen: json['totalChosen'],
    );
  }
}
