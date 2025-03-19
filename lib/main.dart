import 'package:flutter/material.dart';
import 'package:ticket_system/core/configs/theme/app_theme.dart';
import 'package:ticket_system/presentation/Staff/pages/staff_dashboard.dart';
import 'package:ticket_system/presentation/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ticket System",
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
