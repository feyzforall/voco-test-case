import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/endpoints.dart';
import '../../../core/utils/exceptions/server_exception.dart';
import '../../../core/utils/network_manager.dart';
import '../../model/user_model.dart';

final remoteUserRepositoryProvider = Provider<RemoteUserRepository>(
  (ref) => RemoteUserRepository(
    ref.read(networkManagerProvider),
  ),
);

class RemoteUserRepository {
  final NetworkManager networkManager;

  RemoteUserRepository(this.networkManager);

  Future<Either<ServerException, List<User>?>> fetchUsers() async {
    try {
      final response = await networkManager.get(
        Endpoints.users,
      );

      final userModel = UserModel.fromJson(
        response.data,
      );

      return Right(userModel.users);
    } on ServerException catch (err) {
      return Left(err);
    }
  }
}
