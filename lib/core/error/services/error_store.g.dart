// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ErrorStore on _ErrorStore, Store {
  final _$isErrorAtom = Atom(name: '_ErrorStore.isError');

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_ErrorStore.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$isTimeOutErrorAtom = Atom(name: '_ErrorStore.isTimeOutError');

  @override
  bool get isTimeOutError {
    _$isTimeOutErrorAtom.reportRead();
    return super.isTimeOutError;
  }

  @override
  set isTimeOutError(bool value) {
    _$isTimeOutErrorAtom.reportWrite(value, super.isTimeOutError, () {
      super.isTimeOutError = value;
    });
  }

  @override
  String toString() {
    return '''
isError: ${isError},
errorMessage: ${errorMessage},
isTimeOutError: ${isTimeOutError}
    ''';
  }
}
