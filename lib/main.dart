import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/App_theme.dart';
import 'package:islami_app/screens/home_screen.dart';
import 'package:islami_app/screens/sura_screen.dart';

void main() {
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routName: (_) => HomeScreen(),
      SuraScreen.routeName:(context) => SuraScreen()},
      initialRoute: HomeScreen.routName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: .dark,
    );
  }
}
