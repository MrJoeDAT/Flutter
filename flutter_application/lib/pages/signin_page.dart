import 'package:flutter/material.dart';
import 'package:flutter_application/utils/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Initialize Supabase client
final client = SupabaseClient(
  'https://jjbbtagytxrkkdqcdonx.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpqYmJ0YWd5dHhya2tkcWNkb254Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4NTM4MjksImV4cCI6MjAxODQyOTgyOX0.2E7kx1yMu-2AIIC1GjB9O7XizLKd43Yhyn-DziTB88Q',
);

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // Initialize controller for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true; // Added to toggle password visibility
  bool isLoading = false;

  // [userLogin] function that handles the login
  Future<String?> userLogin({
    required final String email,
    required final String password,
  }) async {
    final response = await client.auth.signIn(
      email: email,
      password: password,
    );
    final user = response.data?.user;
    return user?.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            largeGap,

            // Email TextInput
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(label: Text('Email')),
              ),
            ),
            smallGap,

            // Password TextInput with reveal/hide button
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
            largeGap,

            // Sign In Button
            isLoading
                ? Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : OutlinedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      dynamic loginValue = await userLogin(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      setState(() {
                        isLoading = false;
                      });
                      if (loginValue != null) {
                        Navigator.pushReplacementNamed(
                          context,
                          '/dashboard',
                        );
                      } else {
                        context.showErrorMessage('Invalid Email or Password');
                      }
                    },
                    child: const Text('Sign In'),
                  ),
          ],
        ),
      ),
    );
  }
}
