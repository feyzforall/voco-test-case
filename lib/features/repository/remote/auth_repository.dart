import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';
import 'package:voco/core/constants/endpoints.dart';
import 'package:voco/core/utils/exceptions/server_exception.dart';
import 'package:voco/core/utils/network_manager.dart';
import 'package:voco/features/model/token_model.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(ref.read(networkManagerProvider)),
);

class AuthRepository {
  final NetworkManager networkManager;

  AuthRepository(this.networkManager);

  Future<Either<ServerException, TokenModel>> login(String email, String password) async {
    try {
      final response = await networkManager.post(
        Endpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      return Right(
        TokenModel.fromJson(response.data),
      );
    } on ServerException catch (err) {
      return Left(err);
    }
  }
}