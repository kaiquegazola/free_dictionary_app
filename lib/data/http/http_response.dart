class HttpResponse<T> {
  const HttpResponse({
    required this.data,
    required this.statusCode,
    required this.headers,
  });

  final T data;
  final int statusCode;
  final Map<String, String> headers;
}
