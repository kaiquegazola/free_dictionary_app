import '../constants/http_status_codes.dart';
import 'generic_exception.dart';

class NoInternetError extends GenericException {}

abstract class HttpError extends GenericException {
  HttpError({required this.statusCode, super.message});

  final int statusCode;
}

class BadRequest extends HttpError {
  BadRequest() : super(statusCode: HttpStatusCode.badRequest);
}

class BusinessError extends HttpError {
  BusinessError({this.code, super.message})
    : super(statusCode: HttpStatusCode.unprocessableEntity);

  final String? code;
}

class ForbiddenError extends HttpError {
  ForbiddenError() : super(statusCode: HttpStatusCode.forbidden);
}

class ServerError extends HttpError {
  ServerError({super.statusCode = HttpStatusCode.internalServerError});
}

class NotAuthorizedError extends HttpError {
  NotAuthorizedError() : super(statusCode: HttpStatusCode.unauthorized);
}

class NotFound extends HttpError {
  NotFound() : super(statusCode: HttpStatusCode.notFound);
}

class RequestConflict extends HttpError {
  RequestConflict() : super(statusCode: HttpStatusCode.conflict);
}

class TimeoutError extends HttpError {
  TimeoutError({String? message}) : super(statusCode: HttpStatusCode.timeout);
}

class NoContentError extends HttpError {
  NoContentError({String? message})
    : super(statusCode: HttpStatusCode.noContent);
}
