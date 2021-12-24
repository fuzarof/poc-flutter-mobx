import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:poc_flutter_mobx/core/error/models/api_exception.dart';

class ApiExceptionHandler {
  static handleException(exception) {
    debugPrint(exception.toString());

    if (exception is DioError) {
      switch (exception.type) {
        case DioErrorType.connectTimeout:
          return ApiException(null, 'The connection has timed out', exception.response!.statusCode);
        case DioErrorType.receiveTimeout:
          return ApiException(null, 'The connection has timed out', exception.response!.statusCode);
        case DioErrorType.sendTimeout:
          return ApiException(null, 'The connection has timed out', exception.response!.statusCode);
        case DioErrorType.response:
          var res = exception.response;
          var data = exception.response?.data as Map;
          return ApiException(exception.message, data["error"], res!.statusCode);
        default:
          return ApiException(null, "Unexpected error", exception.response?.statusCode);
      }
    } else {
      return ApiException(null, "Unexpected error", null);
    }
  }
}
