import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/voco_assets.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        VocoAssets.animation,
        width: 96,
        height: 96,
      ),
    );
  }
}
