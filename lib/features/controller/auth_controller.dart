import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco/core/utils/exceptions/server_exception.dart';
import 'package:voco/features/repository/locale/locale_auth_repository.dart';
import 'package:voco/features/repository/remote/remote_auth_repository.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue>(
  (ref) {
    return AuthController(
      ref,
      ref.read(remoteAuthRepositoryProvider),
      ref.read(localAuthRepositoryProvider),
    );
  },
);

class AuthController extends StateNotifier<AsyncValue> {
  AuthController(
    this.ref,
    this.remoteAuthRepository,
    this.localAuthRepository,
  ) : super(const AsyncValue.data(null));

  final Ref ref;
  final RemoteAuthRepository remoteAuthRepository;
  final LocalAuthRepository localAuthRepository;

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      final response = await remoteAuthRepository.login(email, password);
      response.fold(
        (l) => state = AsyncError(l, StackTrace.current),
        (r) async {
          await localAuthRepository.saveToken(r.token ?? "");
          await localAuthRepository.fetchToken();
          state = AsyncData(r);
        },
      );
    } on ServerException catch (err) {
      state = AsyncError(err, StackTrace.current);
    }
  }
}
