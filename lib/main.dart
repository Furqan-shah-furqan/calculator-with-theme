import 'package:calculator/Home/home.dart';
import 'package:calculator/Models/calculator.dart';
import 'package:calculator/Theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Calculator()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themedata,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
