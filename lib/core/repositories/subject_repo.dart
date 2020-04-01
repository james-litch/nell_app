// get data from api or shared prefefences

import 'dart:convert';

import 'package:nell/core/locator.dart';
import 'package:nell/core/models/subject_model.dart';
import 'package:nell/core/services/api_service.dart';
import 'package:nell/core/services/dialog_service.dart';

class SubjectRepo {
  ApiService _apiService = locator<ApiService>();
  DialogService _dialogService = locator<DialogService>();

  Future<List> getSubjects() async {
    var body = {
      "query": subjectsQuery,
    };

    var subjects;

    try {
      var res = await _apiService.query(json.encode(body));

      subjects = (res['data']['me']['subjects'] as List)
          .map((subject) => Subject.fromJson(subject))
          .toList();
    } catch (e) {
      _dialogService.showDialog(
          title: 'Query Error', description: e.toString());
    }
    return subjects;
  }

  String subjectsQuery = '''
    query {

      me {

        subjects {
          admin
          
          subject {
            name
            id

            currentQuestions {
              question
              id
            }

            dictionary{
              id
              phrase
              definition
            }

            exams{
              id
              name
              description
            }

            feedback
          }
        }
      }
    }
  ''';
}
