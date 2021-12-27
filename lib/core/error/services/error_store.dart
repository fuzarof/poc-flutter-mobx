import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:poc_flutter_mobx/core/error/models/api_exception.dart';

part 'error_store.g.dart';

class ErrorStore = _ErrorStore with _$ErrorStore;

abstract class _ErrorStore with Store {
  @observable
  bool isError = false;

  @observable
  String? errorMessage;

  @observable
  bool isTimeOutError = false;

  void handleException(exception) {
    //todo padronizar junto com o backend
    debugPrint(exception.toString());
    isError = true;
    isTimeOutError = false;
    if (exception is TimeoutException) {
      isTimeOutError = true;
      errorMessage = "TimeOutException";
    } else if (exception is ApiException) {
      errorMessage = exception.message;
    } else {
      errorMessage = "DefaultErrorException";
    }
  }

  resetErrors() {
    isTimeOutError = false;
    errorMessage = "";
    isError = false;
  }
}
