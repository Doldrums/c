import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/app_bar.dart';

class SeekPage extends HookConsumerWidget {
  const SeekPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CustomAppBar(),
        Spacer(),
      ],
    );
  }
}
