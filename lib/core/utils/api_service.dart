import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'https://api.themoviedb.org/3/';
  final String api_key = 'api_key=4b772df667cc122ed50ed4613a03f480';

  final Dio dio;

  ApiService(this.dio);
  Future<dynamic> get({required String endPoint}) async {
    final url = '$baseUrl/$endPoint?$api_key';

    final response = await dio.get(url);
    return response.data;
  }
}
