import 'package:dio/dio.dart';

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);
}

class UnauthorizedException extends DioError {
  UnauthorizedException(
    RequestOptions r,
  ) : super(requestOptions: r);
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);
}

class TimeOutException extends DioError {
  TimeOutException(RequestOptions r) : super(requestOptions: r);
}

class NoDataException extends CustomError {
  @override
  String toString() {
    return 'Success, but empty list';
  }
}

class DataParsingException extends CustomError {
  @override
  String toString() {
    return 'Success, but empty list';
  }
}

class LocalStorageException extends CustomError {
  @override
  String toString() {
    return 'Success, but empty list';
  }
}

class CustomError implements Exception {
  CustomError({
    this.requestOptions,
    this.response,
    this.type = DioErrorType.other,
    this.error,
  });

  /// Request info.
  RequestOptions? requestOptions;

  /// Response info, it may be `null` if the request can't reach to
  /// the http server, for example, occurring a dns error, network is not available.
  Response? response;

  DioErrorType type;

  /// The original error/exception object; It's usually not null when `type`
  /// is DioErrorType.other
  dynamic error;

  StackTrace? _stackTrace;

  set stackTrace(StackTrace? stack) => _stackTrace = stack;

  StackTrace? get stackTrace => _stackTrace;

  String get message => (error?.toString() ?? '');

  @override
  String toString() {
    var msg = 'DioError [$type]: $message';
    if (error is Error) {
      msg += '\n${(error as Error).stackTrace}';
    }
    if (_stackTrace != null) {
      msg += '\nSource stack:\n$stackTrace';
    }
    return msg;
  }
}
