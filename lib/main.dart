import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/App_theme.dart';
import 'package:islami_app/screens/home_screen.dart';
import 'package:islami_app/screens/onboarding_screen.dart';
import 'package:islami_app/screens/sura_screen.dart';
import 'package:islami_app/widgets/tabs_services/quran_service/quran_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuranServices.getSharedPref();
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routName: (_) => HomeScreen(),
        SuraScreen.routeName: (context) => SuraScreen(),
        OnboardingScreen.routName: (context) => OnboardingScreen(),
      },
      initialRoute: QuranServices.isSeenOnboarging
          ? HomeScreen.routName
          : OnboardingScreen.routName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: .dark,
    );
  }
}
