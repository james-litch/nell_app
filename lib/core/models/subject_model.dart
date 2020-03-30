import 'package:nell/core/base/base_model.dart';

class Subject extends BaseModel {
  final String id;
  final String name;
  final bool isAdmin;
  final List<CurrentQuestion> currentQuestions;
  // final List<Exam>exams;
  // final Map<String, String> definitions;
  // final List<Question> questions;
  // final List<String> feedback;

  Subject({this.id, this.name, this.isAdmin, this.currentQuestions});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject']['id'] = this.id;
    data['subject']['name'] = this.name;
    data['admin'] = this.isAdmin;

    return data;
  }

  factory Subject.fromJson(Map<String, dynamic> json) {
    List<CurrentQuestion> currentQList =
        (json['subject']['currentQuestions'] as List)
            .map((i) => CurrentQuestion.fromJson(i))
            .toList();
            

    return Subject(
      isAdmin: json['admin'],
      id: json['subject']['id'],
      name: json['subject']['name'],
      currentQuestions: currentQList,
    );
  }

  @override
  List<Object> get props => [id, name, isAdmin, currentQuestions];

  @override
  bool get stringify => true;
}

class Exam {
  String id;
  String name;
  String description;
  List<CurrentQuestion> question;
}

class CurrentQuestion {
  final String id;
  final String question;

  CurrentQuestion({this.id, this.question});

  factory CurrentQuestion.fromJson(Map<String, dynamic> json) {
    return CurrentQuestion(
      id: json['id'],
      question: json['question'],
    );
  }
}

class Answer {
  String answer;
  int totalChosen;
}
