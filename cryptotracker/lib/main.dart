
import 'package:cryptotracker/screens/home_page2.dart';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(floatingActionButtonTheme: const  FloatingActionButtonThemeData(backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.grey.shade300,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
