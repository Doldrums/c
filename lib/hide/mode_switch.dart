import 'package:audioplayers/audioplayers.dart';
import 'package:c/hide/provider/ble_provider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModeSwitch extends HookConsumerWidget {
  final void Function()? onPressed;

  const ModeSwitch(this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.read(modeProvider);
    return SizedBox(
      width: 300.0,
      height: 300.0,
      child: Neumorphic(
        margin: const EdgeInsets.all(14),
        style: const NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
        ),
        child: Neumorphic(
          style: const NeumorphicStyle(
            depth: 14,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          margin: const EdgeInsets.all(20),
          child: Neumorphic(
            style: const NeumorphicStyle(
              depth: -8,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            margin: const EdgeInsets.all(10),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: NeumorphicSwitch(
                  value: isEnabled,
                  onChanged: (value) {
                    onPressed?.call();
                    if (isEnabled) {
                      final player = AudioPlayer();
                      player
                          .play(UrlSource('https://mobcup.net/d/c3lpbxp8/mp3'));
                    } else {
                      ref.read(bleProvider.notifier).sendInfoByBLE();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
