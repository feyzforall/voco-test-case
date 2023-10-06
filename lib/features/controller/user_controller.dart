import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';
import '../repository/remote/remote_user_repository.dart';

final userControllerProvider = StateNotifierProvider<UserController, AsyncValue>(
  (ref) => UserController(ref.read(remoteUserRepositoryProvider)),
);

class UserController extends StateNotifier<AsyncValue<List<User>?>> {
  UserController(this.remoteUserRepository) : super(const AsyncLoading());

  final RemoteUserRepository remoteUserRepository;

  Future<void> getUsers() async {
    state = const AsyncLoading();

    final response = await remoteUserRepository.fetchUsers();
    response.fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (r) => state = AsyncData(r),
    );
  }
}
