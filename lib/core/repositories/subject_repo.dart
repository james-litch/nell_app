// get data from api or shared prefefences

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nell/core/constants/api_constants.dart';
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
      // _dialogService.showDialog(
      //     title: 'Query Error', description: e.toString());
      print(e.toString());
    }
    return subjects;
  }

  Future<List<Question>> getQuestion({
    @required String subjectId,
    @required String questionId,
  }) async {
    var body = {
      "query": questionQuery,
      "variables": {
        "input": {
          "subjectId": subjectId,
          "questionId": questionId,
        }
      }
    };
    var res = await _apiService.query(json.encode(body));

    List<Question> questions = List();

    var question = Question.fromJson(res['data']['findQuestion']);

    questions.add(question);

    return questions;
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
  }

  Future sendFeedback(
      {@required String subjectId, @required String feedback}) async {
    var body = {
      "query": feedbackQuery,
      "variables": {
        "input": {
          "subjectId": subjectId,
          "question": feedback,
        }
      }
    };
    var res = await _apiService.query(json.encode(body));

    return res['data'] == null ? res['errors'][0]['message'] : true;
  }
}
