import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:poc_flutter_mobx/core/error/models/api_exception.dart';

class ApiExceptionHandler {
  static ApiException handleException(exception) {
    debugPrint(exception.toString());

    if (exception is DioError) {
      switch (exception.type) {
        case DioErrorType.connectTimeout:
          return ApiException(
              message: 'The connection has timed out', statusCode: exception.response!.statusCode!);
        case DioErrorType.receiveTimeout:
          return ApiException(
              message: 'The connection has timed out', statusCode: exception.response!.statusCode!);
        case DioErrorType.sendTimeout:
          return ApiException(
              message: 'The connection has timed out', statusCode: exception.response!.statusCode!);
        case DioErrorType.response:
          var res = exception.response;
          var data = exception.response?.data as Map;
          return ApiException(message: data["error"], statusCode: res!.statusCode!);
        default:
          return ApiException(message: 'Unexpected Error', statusCode: exception.response!.statusCode!);
      }
    } else {
      return ApiException(message: "Unexpected error", statusCode: -1);
    }
  }
}
