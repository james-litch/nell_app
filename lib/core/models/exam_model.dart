class Exam {
  String id;
  String name;
  String description;

  Exam({this.id, this.name, this.description});

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}