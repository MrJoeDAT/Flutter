import 'package:flutter/material.dart';
import 'package:flutter_application/utils/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Initialize Supabase client
final client = SupabaseClient(
  'https://jjbbtagytxrkkdqcdonx.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpqYmJ0YWd5dHhya2tkcWNkb254Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4NTM4MjksImV4cCI6MjAxODQyOTgyOX0.2E7kx1yMu-2AIIC1GjB9O7XizLKd43Yhyn-DziTB88Q',
);

class SimpleAppPage extends StatefulWidget {
  const SimpleAppPage({super.key});

  @override
  State<SimpleAppPage> createState() => _SimpleAppPageState();
}

Future<String?> getUserEmail() async {
  // Retrieve user information from storage or database
  // For example, using Supabase:
  final response = await client
      .from('users')
      .select('email')
      .eq('user_id', client.auth.currentUser?.id)
      .single()
      .execute();

  return response.data['email'] as String?;
}

class _SimpleAppPageState extends State<SimpleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                client.auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              icon: const Icon(Icons.logout),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            const Icon(
              Icons.sailing_rounded,
              size: 150,
              color: Colors.blue,
            ),
            smallGap,

            // Text
            const Text(
              'Welcome',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 50,
              ),
            ),

            /*Text(
              'Hello! ${client.auth.currentUser?.email}',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 50,
              ),
            ),
            largeGap,*/

            // Sign Out Button
            OutlinedButton(
              onPressed: () {
                client.auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
