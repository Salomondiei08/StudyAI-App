class KoException implements Exception {
  final int statusCode;
  final String? message;
  KoException({
    required this.statusCode,
    this.message,
  });

  @override
  String toString() {
    return "KO Exception: statusCode: $statusCode, message: ${message ?? "No message specified !"}";
  }
}