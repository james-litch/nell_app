import 'dart:convert';

import 'package:nell/core/base/base_service.dart';
import 'package:nell/core/services/storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:nell/core/constants/api_constants.dart';
import '../locator.dart';

class ApiService extends BaseService {
  final StorageService _storageService = locator<StorageService>();

  getHeaders() {
    var headers = _storageService.tokens.toJson();

    headers.addAll({'Content-Type': 'application/json'});

    return headers;
  }

  Future persistToken() async {
    // TODO: persist token
    return true;
  }

  Future query(String body) async {
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
}
