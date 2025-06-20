class FileSizeLimitExceededException implements Exception {
  final String message;
  FileSizeLimitExceededException(this.message);

  @override
  String toString() => 'FileSizeLimitExceededException: $message';
}
