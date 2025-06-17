// lib/screens/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('홈 화면', style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
