/// Errors received while processing locally will be processed in this format.
class CacheException implements Exception {
  final String message;

  CacheException({required this.message});
}
