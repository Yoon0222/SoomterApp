import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soomter App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const MainPage(),
    );
  }
}
