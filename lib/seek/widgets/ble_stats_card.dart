import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/neumorphic_card_base.dart';
import '../seek_provider.dart';

class BLEStatsCard extends HookConsumerWidget {
  const BLEStatsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<dynamic> message = ref.watch(bleStreamProvider);

    return NeumorphicCardBase(
      content: message.when(
        loading: () => const SizedBox(
          height: 200,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        error: (err, stack) => Text('Error: $err'),
        data: (message) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text(message),
            ),
          );
        },
      ),
    );
  }
}
