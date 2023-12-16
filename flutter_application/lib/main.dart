import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pages/account_page.dart';
import 'pages/login_page.dart';
import 'pages/splash_page.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://vydfjpwoaqpbvqdgthfx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ5ZGZqcHdvYXFwYnZxZGd0aGZ4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI2MzgwNDQsImV4cCI6MjAxODIxNDA0NH0.Tsg6ej6nUL8--bZjevof5nBwF_mn-TzZEGA-amZmG4g',
    authFlowType: AuthFlowType.pkce,
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/account': (context) => const AccountPage(),
      },
    );
  }
}
