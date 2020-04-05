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

  Future makeQuestionCurrent({
    @required String subjectId,
    @required String questionId,
  }) async {
    var body = {
      "query": makeQuestionCurrentQuery,
      "variables": {
        "input": {
          "subjectId": subjectId,
          "questionId": questionId,
        }
      }
    };
    var res = await _apiService.query(json.encode(body));

    return res is String ? res : true;
  }

  Future removeCurrentQuestion({
    @required String subjectId,
    @required String questionId,
  }) async {
    var body = {
      "query": removeCurrentQuestionsQuery,
      "variables": {
        "input": {
          "subjectId": subjectId,
          "questionIds": [questionId],
        }
      }
    };
    var res = await _apiService.query(json.encode(body));

    return res is String ? res : true;
  }

  Future deleteQuestion({
    @required String subjectId,
    @required String questionId,
  }) async {
    var body = {
      "query": deleteQuestionsQuery,
      "variables": {
        "input": {
          "subjectId": subjectId,
          "questionIds": [questionId],
        }
      }
    };
    var res = await _apiService.query(json.encode(body));

    return res is String ? res : true;
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

  Future deleteExam({
    @required String subjectId,
    @required String examId,
  }) async {
    var body = {
      "query": deleteExamsQuery,
      "variables": {
        "input": {
          "subjectId": subjectId,
          "examIds": [examId],
        }
      }
    };
    var res = await _apiService.query(json.encode(body));

    return res is String ? res : true;
  }

  Future makeUserAdmin({
    @required subjectId,
    @required userId,
  }) async {
    var body = {
      "query": addAdminQuery,
      "variables": {
        "input": {
          "subjectId": subjectId,
          "userId": userId,
        }
      }
    };
    var res = await _apiService.query(json.encode(body));

    return res is String ? res : true;
  }


  Future deleteDefinition({
    @required subjectId,
    @required definitionId,
  }) async {
    var body = {
      "query": deleteDefinitionsQuery,
      "variables": {
        "input": {
          "subjectId": subjectId,
          "definitionIds": [definitionId],
        }
      }
    };
    var res = await _apiService.query(json.encode(body));

    return res is String ? res : true;
  }


  Future sendFeedback({
    @required String subjectId,
    @required String feedback,
  }) async {
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
