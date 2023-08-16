import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Main-page/mainpage.dart';
import '_models/ThemeM.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => ThemeM(), child: const MyApp()));
}

// ignore_for_file: prefer_const_constructors
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeM>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Portfolio',
            themeMode: provider.currentTheme(),
            darkTheme: ThemeData.dark(useMaterial3: true),
            theme: ThemeData.light(useMaterial3: true),
            // theme: ThemeData.dark(useMaterial3: true),
            home: child, debugShowCheckedModeBanner: false,
          );
        },
        child: MainPage());
  }
}
