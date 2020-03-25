import 'package:nell/core/base/base_model.dart';

class Subject extends BaseModel {
  final String id;
  final String name;
  final bool isAdmin;
  List<Exam>exams;
  Map<String, String> definitions;
  List<Question> questions;
  List<String> feedback;

  Subject({this.id, this.name, this.isAdmin});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject']['id'] = this.id;
    data['subject']['name'] = this.name;
    data['admin'] = this.isAdmin;

    return data;
  }

  Subject.fromJson(Map<String, dynamic> json)
      : id = json['subject']['id'],
        name = json['subject']['name'],
        isAdmin = json['admin'];

  @override
  List<Object> get props => [id, name, isAdmin];

  @override
  bool get stringify => true;
}

class Exam {
  String id;
  String name;
  String description;
  List<Question> question;
}

class Question {
  String id;
  String question;
  List<Answer> answers;
  List<String> answeredBy;
  int correctAnswer;
}

class Answer {
  String answer;
  int totalChosen;
}
