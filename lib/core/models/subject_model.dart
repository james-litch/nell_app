class Subject {
  String id;
  String name;
  bool admin;

  Subject({this.id, this.name, this.admin});

  Subject.fromJson(Map<String, dynamic> json)
      : id = json['subject']['id'],
        name = json['subject']['name'],
        admin = json['admin'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject']['id'] = this.id;
    data['subject']['name'] = this.name;
    data['admin'] = this.admin;

    return data;
  }
}