abstract class HttpClient {
  Future<Map<String, dynamic>> get(String url);
  Future<Map<String, dynamic>> post(String url, {Map<String, dynamic>? data});
}
