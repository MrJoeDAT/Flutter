import 'package:flutter_application/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Initialize Supabase client
final client = SupabaseClient(
  'https://jjbbtagytxrkkdqcdonx.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpqYmJ0YWd5dHhya2tkcWNkb254Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4NTM4MjksImV4cCI6MjAxODQyOTgyOX0.2E7kx1yMu-2AIIC1GjB9O7XizLKd43Yhyn-DziTB88Q',
);

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _obscureText = true;

  Future<bool> createUser({
    required final String email,
    required final String password,
    required final String name,
  }) async {
    try {
      final response = await client.auth.signUp(
        email,
        password,
      );
      final error = response.error;
      if (error == null) {
        final user = response.user;
        if (user != null) {
          await client.from('profiles').upsert([
            {
              'id': user.id,
              'name': name,
            }
          ]).execute();
          return true;
        } else {
          print('Error during sign up: User is null.');
          return false;
        }
      } else {
        print('Sign-up error: ${error.message}');
        print('Sign-up response data: ${response.data}');
        return false;
      }
    } catch (error) {
      print('Error during sign up: $error');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.sailing_rounded,
              size: 150,
              color: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                obscureText: _obscureText,
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () async {
                final userValue = await createUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  name: _nameController.text,
                );

                if (userValue == true) {
                  context.showErrorMessage('Check your mail for confirmation');
                  await Future.delayed(Duration(seconds: 2));
                  await Navigator.pushReplacementNamed(context, '/signin');
                } else {
                  context.showErrorMessage('Sign-up failed. Please try again.');
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
