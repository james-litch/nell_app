import 'package:nell/core/base/base_model.dart';
import 'package:nell/core/models/current_question_model.dart';
import 'package:nell/core/models/definition_model.dart';
import 'package:nell/core/models/exam_model.dart';
import 'package:nell/core/models/question_model.dart';
import 'package:nell/core/models/user_model.dart';

class Subject extends BaseModel {
  final String id;
  final String name;
  final bool isAdmin;
  final List<CurrentQuestion> currentQuestions;
  final List<Definition> dictionary;
  final List<Exam> exams;
  final List<Question> questions;
  final List<String> feedback;
  final List<User> users;
  final List<User> admins;

  Subject({
    this.dictionary,
    this.id,
    this.name,
    this.isAdmin,
    this.currentQuestions,
    this.questions,
    this.exams,
    this.feedback,
    this.admins,
    this.users,
  });

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['subject']['id'] = this.id;
  //   data['subject']['name'] = this.name;
  //   data['admin'] = this.isAdmin;

  //   return data;
  // }

  factory Subject.fromJson(Map<String, dynamic> json) {
    List<CurrentQuestion> currentQList =
        (json['subject']['currentQuestions'] as List)
            .map((i) => CurrentQuestion.fromJson(i))
            .toList();

    List<Question> questionList = (json['subject']['questions'] as List)
        .map((i) => Question.fromJson(i))
        .toList();

    List<Definition> defList = (json['subject']['dictionary'] as List)
        .map((i) => Definition.fromJson(i))
        .toList();

    List<Exam> examList = (json['subject']['exams'] as List)
        .map((i) => Exam.fromJson(i))
        .toList();

    List<User> userList = (json['subject']['users'] as List)
        .map((i) => User.fromJson(i))
        .toList();

    List<User> adminList = (json['subject']['admins'] as List)
        .map((i) => User.fromJson(i))
        .toList();

    List<String> feedbackList = (json['subject']['feedback']).cast<String>();

    return Subject(
      isAdmin: json['admin'],
      id: json['subject']['id'],
      name: json['subject']['name'],
      currentQuestions: currentQList,
      dictionary: defList,
      exams: examList,
      feedback: feedbackList,
      admins: adminList,
      users: userList,
      questions: questionList,
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        isAdmin,
        currentQuestions,
        dictionary,
        exams,
        feedback,
        users,
        admins
      ];

  @override
  bool get stringify => true;
}
