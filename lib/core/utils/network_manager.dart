import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../features/model/error_model.dart';
import '../constants/endpoints.dart';
import 'exceptions/server_exception.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final networkManagerProvider = Provider<NetworkManager>(
  (ref) => NetworkManager(
    ref.read(dioProvider),
  ),
);

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
      return response;
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
      return response;
    } on DioException catch (err) {
      throw _throwException(err);
    }
  }

  ServerException _throwException(DioException error) {
    const String customErrorMessage = 'We encountered an unexpected error. Please try again later.';
    String errorMessage = '';

    // When the service does not work, the error is returned as html output.
    // This control is used for this reason.
    if (error.response!.data is Map) {
      ErrorModel? errorModel = ErrorModel.fromJson(error.response?.data);
      errorMessage = errorModel.error ?? customErrorMessage;
    } else {
      errorMessage = customErrorMessage;
    }

    throw ServerException(
      message: errorMessage,
      statusCode: error.response?.statusCode,
    );
  }
}
