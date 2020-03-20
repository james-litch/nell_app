import 'package:nell/core/models/subject_model.dart';

class User {
  String name;
  String email;
  List<Subject> subjects;

  // 

  User();

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

