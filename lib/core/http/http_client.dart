import 'package:free_dictionary/data/data.dart';

abstract class HttpClient {
  Future<HttpResponse<T>> get<T>(String url);
  Future<HttpResponse<T>> post<T>(
    String url, {
    Map<String, dynamic>? data,
  });
}
