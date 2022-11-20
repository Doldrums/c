import 'dart:async';
import 'package:c/hide/mode_switch.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vibration/vibration.dart';

import '../../common/app_bar.dart';
import '../provider/ble_provider.dart';
import '../provider/models/connection_details.dart';

class ConnectionOnPage extends HookConsumerWidget {
  final ConnectionDetails details;

  const ConnectionOnPage({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomAppBar(),
        const Spacer(),
        Center(
          child: GestureDetector(
            onTap: () async {
              if (await Vibration.hasVibrator() ?? false) {
                Vibration.vibrate();
              }
            },
            child: ModeSwitch(() {
              ref.read(modeProvider.notifier).state = !ref.read(modeProvider);
            }),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
