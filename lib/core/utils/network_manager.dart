import 'package:dio/dio.dart';
import 'package:voco/core/constants/endpoints.dart';
import 'package:voco/core/utils/exceptions/server_exception.dart';

class NetworkManager {
  final Dio dio;

  NetworkManager(this.dio) {
    _initializeDio();
  }

  void _initializeDio() {
    // ignore: avoid_single_cascade_in_expression_statements
    dio..options.baseUrl = Endpoints.baseUrl;
  }

  Future<Response> get(String path) async {
    try {
      final Response<dynamic> response = await dio.get(path);
      return response.data;
    } on DioException catch (err) {
      throw _throwException(err);
    }
  }

  Future<Response> post(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response<dynamic> response = await dio.post(
        path,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on DioException catch (err) {
      throw _throwException(err);
    }
  }

  DioException _throwException(DioException error) {
    throw ServerException(
      message: error.message.toString(),
      statusCode: error.response?.statusCode,
    );
  }
}
