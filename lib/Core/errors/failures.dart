import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures(this.errorMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection Time Out With Api Server.");

      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Time Out With Api Server.");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive Time Out With Api Server.");

      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificated Time Out With Api Server.");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure("Request To Api Server Was Canceled.");

      case DioExceptionType.connectionError:
        return ServerFailure("Connection Error With Api Server.");

      case DioExceptionType.unknown:
        return ServerFailure("Unexpected Error, Please Try Again.");

      default:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure("No Internet Connection");
        } else {
          return ServerFailure("Opps there was an error, Please try Again!");
        }
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try later!');
    } else {
      return ServerFailure('Oops there was an error, Please try Again!');
    }
  }
}
