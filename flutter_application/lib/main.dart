//import 'utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/users/fragments/dashboard_of_fragments.dart';
//import 'package:flutter_application/users/fragments/home_fragment_screen.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pages/home_page.dart';
import 'pages/signin_page.dart';
import 'pages/signup_page.dart';
import 'pages/simpleapp_page.dart';

// Initialize Supabase client
final client = SupabaseClient(
  'https://jjbbtagytxrkkdqcdonx.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpqYmJ0YWd5dHhya2tkcWNkb254Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4NTM4MjksImV4cCI6MjAxODQyOTgyOX0.2E7kx1yMu-2AIIC1GjB9O7XizLKd43Yhyn-DziTB88Q',
);

void main() async {
  await Supabase.initialize(
    url: 'https://jjbbtagytxrkkdqcdonx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpqYmJ0YWd5dHhya2tkcWNkb254Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4NTM4MjksImV4cCI6MjAxODQyOTgyOX0.2E7kx1yMu-2AIIC1GjB9O7XizLKd43Yhyn-DziTB88Q',
  );

  //WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: client.auth.currentSession != null ? '/simpleapp' : '/',
      routes: {
        '/': (context) => const HomePage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/simpleapp': (context) => const SimpleAppPage(),
        '/dashboard': (context) => DashboardOfFragments(),
      },
    );
  }
}
