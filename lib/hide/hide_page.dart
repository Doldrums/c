import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/app_bar.dart';
import 'mode_switch.dart';

class HidePage extends HookConsumerWidget {
  const HidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomAppBar(),
        const Spacer(),
        Center(
          child: ModeSwitch(() {}),
        ),
        const Spacer(),
      ],
    );
  }
}
