class SearchNotInitiatedException implements Exception {
  final message = "Cannot get the next result page without searching first.";
}

class NoSearchTitleResultsException implements Exception {
  final message = "No results";
}

class NoSearchUserResultsException implements Exception {
  final message = "No results";
}

class NoNextUrlException implements Exception {
  final message = "No results";
}

class ServiceError implements Exception {
  final message = "Cannot get item from service";
}
