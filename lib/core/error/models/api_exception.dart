class ApiException implements Exception {
  final String? field;
  final String? message;
  final int? statusCode;
  final String? reason;

  ApiException(this.field, this.message, this.statusCode, {this.reason});

  @override
  String toString() {
    return 'ApiException{field: $field, message: $message, statusCode: $statusCode, reason: $reason}';
  }
}
