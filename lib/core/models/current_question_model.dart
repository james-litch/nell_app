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