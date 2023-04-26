import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  const Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection Time Out with the Server');
      case DioErrorType.sendTimeout:
        return ServerFailure('time Out!!!');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Recieved timed Out with Service!!');
      case DioErrorType.badCertificate:
        return ServerFailure('there is was a bad Certifecate!!');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure(
            'the Service has been Canceled ,please try later!!');
      case DioErrorType.connectionError:
        return ServerFailure(
            'ther was an error with the connection ,Please try again!!');
      case DioErrorType.unknown:
        return ServerFailure(
            'OOPS there was an unknown problem with the server,try later!!');
      default:
        return ServerFailure('there was an unexpected error');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['status_message']);
    } else if (statusCode == 404) {
      return ServerFailure('your request not Found,try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error,please try later!');
    } else {
      return ServerFailure('there was un erroe,try again');
    }
  }
}
