import 'package:nell/core/base/base_model.dart';

class Subject extends BaseModel{
  final String id;
  final String name;
  final bool isAdmin;
  final List<CurrentQuestion> currentQuestions;
  final List<Definition> dictionary;
  // final List<Exam>exams;
  // final List<Question> questions;
  // final List<String> feedback;

  Subject({
    this.dictionary,
    this.id,
    this.name,
    this.isAdmin,
    this.currentQuestions,
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

    List<Definition> defList = (json['subject']['dictionary'] as List)
        .map((i) => Definition.fromJson(i))
        .toList();

    return Subject(
      isAdmin: json['admin'],
      id: json['subject']['id'],
      name: json['subject']['name'],
      currentQuestions: currentQList,
      dictionary: defList,
    );
  }

  @override
  List<Object> get props => [id, name, isAdmin, currentQuestions, dictionary];

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

class Definition {
  final String id;
  final String phrase;
  final String definition;

  Definition({this.id, this.phrase, this.definition});

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      id: json['id'],
      phrase: json['phrase'],
      definition: json['definition'],
    );
  }
}
