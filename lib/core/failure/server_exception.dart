class ServerException implements Exception {
  final String message;

  ServerException({this.message = "Server error occurred"});
}

class EmptyException implements Exception {
  final String message;

  const EmptyException({required this.message});
}
