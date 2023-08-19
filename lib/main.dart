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
            darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
                textTheme: TextTheme(
                    labelLarge: TextStyle(color: Colors.white70),
                    labelMedium: TextStyle(color: Colors.white70),
                    labelSmall: TextStyle(color: Colors.white70),
                    displayLarge: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                    displayMedium: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                    displaySmall: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                    bodyLarge: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    bodyMedium: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
                cardTheme: CardTheme(
                    color: Colors.white54,
                    surfaceTintColor: Color.fromARGB(255, 19, 7, 36))),
            theme: ThemeData.light(useMaterial3: true).copyWith(
                iconButtonTheme: IconButtonThemeData(style: ButtonStyle(
                    iconColor: MaterialStateColor.resolveWith((states) {
                  return Colors.white;
                }))),
                textTheme: TextTheme(
                    labelLarge: TextStyle(color: Colors.white70),
                    labelMedium: TextStyle(color: Colors.white70),
                    labelSmall: TextStyle(color: Colors.white70),
                    displayMedium: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold),
                    displaySmall: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold),
                    displayLarge: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold),
                    bodyLarge: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    bodyMedium: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
                cardTheme: CardTheme(
                    color: Colors.black54, surfaceTintColor: Colors.grey)),
            // theme: ThemeData.dark(useMaterial3: true),
            home: child, debugShowCheckedModeBanner: false,
          );
        },
        child: MainPage());
  }
}
