import 'package:bkapp_flutter/core/services/api/custom_exception.dart';
import 'package:dio/dio.dart';

class ApiResponses {
  static dynamic apiResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        print(response.data.toString());
        return response.data;
        break;
      case 400:
        throw BadRequestException(response.data.toString());
        break;
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
        break;
      case 500:
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}'
        );
    }
  }
}
