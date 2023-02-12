import 'package:dio/dio.dart';

abstract class Failure {
  final String failMessage;

  const Failure(
    this.failMessage,
  );
}

class ServerFailure extends Failure {
  ServerFailure(
    super.failMessage,
  );

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure(
          'Connection Timeout Failure',
        );
      case DioErrorType.sendTimeout:
        return ServerFailure(
          'Send Timeout Failure',
        );
      case DioErrorType.receiveTimeout:
        return ServerFailure(
          'Receive Timeout Failure',
        );
      case DioErrorType.response:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioErrorType.cancel:
        return ServerFailure(
          'Request is canceled',
        );
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          return ServerFailure(
            'No internet',
          );
        } else {
          return ServerFailure(
            'Unexpected error',
          );
        }
      default:
        return ServerFailure(
          'There wa an error',
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        response['error']['message'],
      );
    } else if (statusCode == 404) {
      return ServerFailure(
        'Request not found',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        'Server Error',
      );
    } else {
      return ServerFailure(
        'There was an error',
      );
    }
  }
}
