import 'package:emojis/emoji.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'behavior_btn.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NeumorphicBackground(
      child: Padding(
        padding: const EdgeInsets.all(96.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: SizedBox(
                width: 240.0,
                height: 240.0,
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
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text('${Emoji.byName('man detective')}',
                                  style: const TextStyle(fontSize: 56)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Game of'.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge!,
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nhide and seek',
                        style: Theme.of(context).textTheme.bodyMedium!,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BehaviorButton(
                  title: 'Be a seeker',
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/seek',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BehaviorButton(
                  title: 'Try to hide',
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/hide',
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
