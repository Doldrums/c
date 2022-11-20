import 'dart:async';
import 'package:c/hide/widgets/player_btn.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mic_stream/mic_stream.dart';
import 'package:vibration/vibration.dart';

import '../../common/app_bar.dart';
import '../provider/ble_provider.dart';
import '../provider/models/connection_details.dart';

class ConnectionOnPage extends HookConsumerWidget {
  final ConnectionDetails details;

  const ConnectionOnPage({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StreamSubscription<List<int>>? listener;
    Stream<List<int>>? stream;
    final distance = ref.watch(approximateDistance);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomAppBar(),
        const Spacer(),
        Center(child: Text('Distance $distance')),
        Center(
          child: GestureDetector(
            onLongPressStart: (LongPressStartDetails details) async {
              ref.read(recordingStateProvider.notifier).state = true;
              await ref.read(bleProvider.notifier).findMessageCharacteristic();
              if (await Vibration.hasVibrator() ?? false) {
                Vibration.vibrate();
              }

              stream = await MicStream.microphone(
                  sampleRate: 44100,
                  audioFormat: AudioFormat.ENCODING_PCM_16BIT,
                  channelConfig: ChannelConfig.CHANNEL_IN_MONO);
              listener = stream!.listen((samples) =>
                  ref.read(bleProvider.notifier).sendSamples(samples));
            },
            onLongPressEnd: (LongPressEndDetails details) async {
              if (await Vibration.hasVibrator() ?? false) {
                Vibration.vibrate();
              }
              listener?.cancel();
              ref.read(recordingStateProvider.notifier).state = false;
            },
            child: const PlayerButton(),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
