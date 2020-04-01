class Question {
  final String id;
  final String question;

  Question({this.id, this.question});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
    );
  }
}