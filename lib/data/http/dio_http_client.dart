import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:free_dictionary_app/core/core.dart';

class DioHttpClient implements HttpClient {
  late final Dio _dio;

  DioHttpClient({String? baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? '',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }

  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> post(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(url, data: data);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  GenericException _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutError();
      case DioExceptionType.connectionError:
        return NoInternetError();
      case DioExceptionType.badResponse:
        return _mapStatusCodeToError(error.response?.statusCode);
      default:
        return NoInternetError();
    }
  }

  HttpError _mapStatusCodeToError(int? statusCode) {
    switch (statusCode) {
      case HttpStatusCode.badRequest:
        return BadRequest();
      case HttpStatusCode.unauthorized:
        return NotAuthorizedError();
      case HttpStatusCode.forbidden:
        return ForbiddenError();
      case HttpStatusCode.notFound:
        return NotFound();
      case HttpStatusCode.conflict:
        return RequestConflict();
      case HttpStatusCode.unprocessableEntity:
        return BusinessError();
      case HttpStatusCode.internalServerError:
        return ServerError();
      default:
        if (statusCode != null && statusCode >= 500) {
          return ServerError(statusCode: statusCode);
        }
        return BadRequest();
    }
  }
}
