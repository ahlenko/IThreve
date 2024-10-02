// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/data/network/failure.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ErrorHandler implements Exception {
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
  late Failure failure;

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioException.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioException.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioException.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioException.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure();
          case ResponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure();
          case ResponseCode.UNAUTHORISED:
            return DataSource.UNAUTHORISED.getFailure();
          case ResponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure();
          case ResponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR.getFailure();
          default:
            return DataSource.DEFAULT.getFailure();
        }

      default:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(
          ResponseCode.BAD_REQUEST,
          ResponseMessage.badRequest,
        );
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.forbidden);
      case DataSource.UNAUTHORISED:
        return Failure(
          ResponseCode.UNAUTHORISED,
          ResponseMessage.unauthorized,
        );
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.notFound);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(
          ResponseCode.INTERNAL_SERVER_ERROR,
          ResponseMessage.internalServerError,
        );
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
          ResponseCode.CONNECT_TIMEOUT,
          ResponseMessage.connectTimeout,
        );
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.cacheError);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
          ResponseCode.RECEIVE_TIMEOUT,
          ResponseMessage.receiveTimeout,
        );
      case DataSource.SEND_TIMEOUT:
        return Failure(
          ResponseCode.SEND_TIMEOUT,
          ResponseMessage.sendTimeout,
        );
      case DataSource.CACHE_ERROR:
        return Failure(
          ResponseCode.CACHE_ERROR,
          ResponseMessage.cacheError,
        );
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
          ResponseCode.NO_INTERNET_CONNECTION,
          ResponseMessage.noInternetConnection,
        );
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.defaultError);
      default:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.defaultError);
    }
  }
}

class ResponseCode {
  // API status codes
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected the request
  static const int UNAUTHORISED = 401; // failure user is not authorised
  static const int NOT_FOUND =
      404; // failure, api url is not correct and not found
  static const int INTERNAL_SERVER_ERROR =
      500; // failure, crash happened in server side

  // local status code
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static String success = Strings.success; // success with data
  static String noContent = Strings.noContent; // success with no content
  static String badRequest =
      Strings.badRequestError; // failure, API rejected our request
  static String forbidden =
      Strings.forbiddenError; // failure, API rejected our request
  static String unauthorized =
      Strings.unauthorizedError; // failure, user is not authorized
  static String notFound = Strings
      .notFoundError; // failure, API URL is not correct and not found on the API side
  static String internalServerError =
      Strings.internalServerError; // failure, a crash happened on the API side

// local responses codes
  static String defaultError = Strings.defaultError; // unknown error happened
  static String connectTimeout = Strings.timeoutError; // issue in connectivity
  static String cancel = Strings.defaultError; // API request was canceled
  static String receiveTimeout = Strings.timeoutError; // issue in connectivity
  static String sendTimeout = Strings.timeoutError; // issue in connectivity
  static String cacheError = Strings
      .defaultError; // issue in getting data from local data source (cache)
  static String noInternetConnection =
      Strings.noInternetError; // issue in connectivity
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
