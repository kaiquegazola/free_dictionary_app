import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:free_dictionary/core/core.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'http_response.dart';

class DioHttpClient implements HttpClient {
  DioHttpClient({String? baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? '',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    _setupInterceptors();
  }
  late final Dio _dio;
  late final CacheOptions _cacheOptions;

  Future<void> _setupInterceptors() async {
    _cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.forceCache,
      maxStale: const Duration(days: 7),
      priority: CachePriority.normal,
    );

    _dio.interceptors.addAll([
      DioCacheInterceptor(options: _cacheOptions),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    ]);
  }

  @override
  Future<HttpResponse<T>> get<T>(String url) async {
    try {
      final response = await _dio.get(
        url,
        options: _cacheOptions.copyWith(
          policy: CachePolicy.forceCache,
        ).toOptions(),
      );

      return HttpResponse(
        data: _convertData<T>(response),
        statusCode: response.statusCode ?? 200,
        headers: _extractHeaders(response),
      );
    } on DioException catch (e) {
      throw _handleError(e);
    } on GenericException catch (_) {
      rethrow;
    } catch (e) {
      throw UnknownError(message: e.toString());
    }
  }

  @override
  Future<HttpResponse<T>> post<T>(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post<T>(
        url,
        data: data,
        options: _cacheOptions.copyWith(
          policy: CachePolicy.noCache,
        ).toOptions(),
      );

      return HttpResponse(
        data: _convertData<T>(response),
        statusCode: response.statusCode ?? 200,
        headers: _extractHeaders(response),
      );
    } on DioException catch (e) {
      throw _handleError(e);
    } on GenericException catch (_) {
      rethrow;
    } catch (e) {
      throw UnknownError(message: e.toString());
    }
  }

  T _convertData<T>(Response response) {
    try {
      final convertedData = response.data as T;
      return convertedData;
    } catch (e) {
      throw ConvertDataError(message: e.toString());
    }
  }

  Map<String, String> _extractHeaders(Response response) {
    final headers = <String, String>{};
    response.headers.forEach((name, values) {
      if (values.isNotEmpty) {
        headers[name] = values.first;
      }
    });
    return headers;
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
