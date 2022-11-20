import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomAppBar extends HookConsumerWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Neumorphic(
            style: NeumorphicStyle(
              depth: 80,
              color: const Color(0xFFF8F9FC),
              intensity: 0.4,
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(8),
              ),
            ),
            child: NeumorphicButton(
              padding: const EdgeInsets.all(12.0),
              onPressed: () => Navigator.of(context).pop(),
              style: NeumorphicStyle(
                depth: -4,
                color: const Color(0xFFF8F9FC),
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(8),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xFF303E57),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
