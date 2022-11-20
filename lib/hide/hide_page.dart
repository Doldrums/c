import 'package:c/hide/provider/ble_provider.dart';
import 'package:c/hide/widgets/connection_off.dart';
import 'package:c/hide/widgets/connection_on.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../common/neumorphic_progress_indicator.dart';
import 'connection/connection_screen.dart';

class HidePage extends HookConsumerWidget {
  const HidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bleManager = ref.watch(bleProvider);
    return Material(
      child: SafeArea(
        child: bleManager.when(
          disconnected: (args) => ConnectionOffPage(
            onPressed: () {
              ref.read(bleProvider.notifier).init();
              showBarModalBottomSheet(
                context: context,
                builder: (context) => const ConnectionScreen(),
              );
            },
          ),
          connected: (args) => ConnectionOnPage(details: args),
          off: () => ConnectionOffPage(
            onPressed: () {
              ref.read(bleProvider.notifier).init();
              showBarModalBottomSheet(
                context: context,
                builder: (context) => const ConnectionScreen(),
              );
            },
          ),
          connecting: () => const NeumorphicProgressIndicator(),
          disconnecting: () => const NeumorphicProgressIndicator(),
          error: (error) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: RichText(
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: 'Ooops...',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: const Color(0xFF303E57),
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "\nIt seems we don't support Bluetooth Low Energy wireless personal area network technology on your device yet.",
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: const Color(0xFF303E57),
                          ),
                    ),
                    TextSpan(
                      text: "\n\n$error",
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: const Color(0xFF303E57),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
