import 'package:c/seek/seek_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import 'hide/hide_page.dart';
import 'home/home.dart';

void main() {
  runApp(const MyApp());
}

var logger = Logger(
  printer: PrettyPrinter(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          '/': (context) => const HomePage(),
          '/seek': (context) => const SeekPage(),
          '/hide': (context) => const HidePage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
