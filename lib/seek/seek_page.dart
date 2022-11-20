import 'package:c/seek/widgets/sound_lvl_stats_card.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/app_bar.dart';

class SeekPage extends HookConsumerWidget {
  const SeekPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NeumorphicBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            const CustomAppBar(),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Seek your target',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            SoundLVLStatsCard(),
          ],
        ),
      ),
    );
  }
}
