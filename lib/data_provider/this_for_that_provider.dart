import 'dart:convert';
import 'dart:io';

import 'package:api_call_bloc/data_provider/custom_network_exceptions.dart';
import 'package:http/http.dart' as http;

class ThisForThatProvider {
  Future<dynamic> get() async {
    var responseJson;
    try {
      final response = await http.get(
        Uri.http(
          'itsthisforthat.com',
          '/api.php',
          {'json': ''},
        ),
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode: ${response.statusCode}',
        );
    }
  }
}
