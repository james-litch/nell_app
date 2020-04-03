// get data from api or shared prefefences

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nell/core/locator.dart';
import 'package:nell/core/models/question_model.dart';
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

  Future<Question> getQuestion({
    @required String subjectId,
    @required String questionId,
  }) async {
    var body = {
      "query": questionQuery,
      "input": {
        "subjectId": subjectId,
        "questionId": questionId,
      }
    };

    var res = await _apiService.query(json.encode(body));

    var question = Question.fromJson(res['data']['findQuestion']);

    return question;
  }

  Future answerQuestion({
    @required String subjectId,
    @required String questionId,
    @required int answer,
  }) async {
    var body = {
      "query": questionQuery,
      "input": {
        "subjectId": subjectId,
        "questionId": questionId,
        "answer": answer
      }
    };
    var res = await _apiService.query(json.encode(body));

    var question = Question.fromJson(res['data']['findQuestion']);

    return question;
  }

  String questionQuery = ''' ''';

  String subjectsQuery = '''
    query {

      me {

        subjects {
          admin
          
          subject {
            name
            id

            questions {
              id
              question
            }

            currentQuestions {
              question
              id
            }

            dictionary {
              id
              phrase
              definition
            }

            exams {
              id
              name
              description
            }

            feedback

            users {
              email
              name
              id
            }

            admins {
              name
              email
              id
            }
          }
        }
      }
    }
  ''';
}
