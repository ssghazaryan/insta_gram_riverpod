import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_gram_riverpod/state/auth/providers/auth_state_provider.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login view',
          style: TextStyle(),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: ref.read(authStateProvider.notifier).logInWithGoogle,
          child: const Text(
            'Sign In with Google',
          ),
        ),
      ),
    );
  }
}
