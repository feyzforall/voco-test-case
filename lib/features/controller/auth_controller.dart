import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco/core/utils/exceptions/server_exception.dart';
import 'package:voco/features/repository/remote/auth_repository.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue>(
  (ref) {
    return AuthController(
      ref,
      ref.read(authRepositoryProvider),
    );
  },
);

class AuthController extends StateNotifier<AsyncValue> {
  AuthController(this.ref, this.authRepository) : super(const AsyncValue.data(null));

  final Ref ref;
  final AuthRepository authRepository;

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      final response = await authRepository.login(email, password);
      response.fold(
        (l) => state = AsyncError(l, StackTrace.current),
        (r) => state = AsyncData(r),
      );
    } on ServerException catch (err) {
      state = AsyncError(err, StackTrace.current);
    }
  }
}
