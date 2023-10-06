import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/voco_colors.dart';
import '../../../core/constants/voco_dimensions.dart';
import '../../controller/user_controller.dart';
import '../../model/user_model.dart';
import '../widgets/loading_animation.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void didChangeDependencies() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await ref.read(userControllerProvider.notifier).getUsers();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: VocoDimensions.pagePadding,
        child: Consumer(
          builder: (_, WidgetRef ref, __) {
            final state = ref.watch(userControllerProvider);
            return state.when(
              data: (users) => ListView.builder(
                itemCount: users?.length,
                itemBuilder: (BuildContext context, int index) {
                  final User user = users![index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: VocoDimensions.pd16.bottom),
                    child: UserCard(user: user),
                  );
                },
              ),
              // TODO : Fancy error widget
              error: (err, __) => Center(
                child: Text(err.toString()),
              ),
              loading: () => const LoadingAnimation(),
            );
          },
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: VocoColors.congressBlue,
      child: ListTile(
        contentPadding: VocoDimensions.pd16,
        leading: ClipRRect(
          borderRadius: VocoDimensions.circularRadius,
          child: Image.network(
            user.avatar.toString(),
          ),
        ),
        title: Text(
          '${user.firstName} ${user.lastName}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        subtitle: Text(
          user.email.toString(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white,
              ),
        ),
        trailing: IconButton(
          // ignore: avoid_print
          onPressed: () => print('this button will DEFINITELY something when the time comes'),
          icon: const Icon(
            Icons.chevron_right_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
