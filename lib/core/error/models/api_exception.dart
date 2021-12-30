class ApiException implements Exception {
  final String message;
  final int statusCode;
  final String? field;
  final String? reason;

  ApiException({required this.message, required this.statusCode, this.field, this.reason});

  @override
  String toString() {
    return 'ApiException{field: $field, message: $message, statusCode: $statusCode, reason: $reason}';
  }
}
