import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nell/core/base/base_service.dart';
import 'package:nell/core/models/token_model.dart';
import 'package:nell/core/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:nell/core/constants/api_constants.dart';
import '../locator.dart';

class ApiService extends BaseService {
  final StorageService _storageService = locator<StorageService>();
  final Dio client = Dio();

  getHeaders() {
    var tokens = _storageService.tokens.toJson();

    return {
      "Content-Type": "application/json",
      "access-token": tokens['access-token'],
      "refresh-token": tokens['refresh-token']
    };
  }

  Future persistToken(var headers) async {
    if (headers['access-token'] != null && headers['refresh-token'] != null) {
      
      var tokens = Tokens(
        headers['access-token'][0],
        headers['refresh-token'][0],
      );

      _storageService.tokens = tokens;
    }

    return true;
  }

  Future query2(String body) async {
    log.i("ApiService: query");
    var headers = getHeaders();
    var response = await http.post(
      apiEndpoint,
      headers: headers,
      body: body,
    );
    var resBody = json.decode(response.body);

    if (resBody['errors'] != null) return (resBody['errors'][0]['message']);

    // persist token

    return resBody;
  }

  Future query(String body) async {
    log.i("ApiService: query");
    var headers = getHeaders();
    var response;

    try {
      response = await client.post(
        apiEndpoint,
        data: body,
        options: Options(headers: headers),
      );
    } catch (e) {
      log.e(e.toString());
      return e.toString();
    }
    if (response.data['errors'] != null)
      return (response.data['errors'][0]['message']);

    // persist token
    persistToken(response.headers);
    return response.data;
  }
}
