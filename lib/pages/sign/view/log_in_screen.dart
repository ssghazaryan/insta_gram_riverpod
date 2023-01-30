import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login view',
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Sign In with Google',
            ),
          ),
        ],
      ),
    );
  }
}
