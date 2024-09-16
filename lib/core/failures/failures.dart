import 'package:dio/dio.dart';

abstract class Failure {
  const Failure(this.errMessage);
  final String errMessage;
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServer was canceld");
      case DioExceptionType.unknown:
        if (dioException.message!.contains("SocketException")) {
          return ServerFailure("No Internet Connection!");
        }
        return ServerFailure("Unexpected Error, please try again later!");
      default:
        return ServerFailure("Unexpected Error: ${dioException.error}");
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      // note if you will use this code in another app respone path will change
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found, please try again later!");
    } else if (statusCode == 500) {
      return ServerFailure("Internal server error, please try again later!");
    } else {
      return ServerFailure("Opps There was an error, please try again later!");
    }
  }
}
