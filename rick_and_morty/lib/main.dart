import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/providers/theme_provider.dart';
import 'package:rick_and_morty/themes/dark_theme.dart';
import 'package:rick_and_morty/themes/ligt_theme.dart';
import 'package:rick_and_morty/view/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    var themeChane = ref.watch(themeProvider.notifier).state;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeChane ? lightTheme : dark,
      home: const HomePage(),
    );
  }
}
