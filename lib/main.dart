import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const IptuDojoApp());
}

class IptuDojoApp extends StatelessWidget {
  const IptuDojoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IPTU BLoC Dojo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
