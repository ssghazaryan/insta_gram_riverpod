import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_gram_riverpod/firebase_options.dart';
import 'package:insta_gram_riverpod/pages/sign/view/login_view.dart';
import 'package:insta_gram_riverpod/state/auth/backend/authenticator.dart';
import 'package:insta_gram_riverpod/state/auth/providers/auth_state_provider.dart';
import 'package:insta_gram_riverpod/state/auth/providers/is_logged_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        indicatorColor: Colors.blueGrey,
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        indicatorColor: Colors.purple,
      ),
      home: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final isLoggedIn = ref.watch(isLoggedProvider);

          if (isLoggedIn) {
            return const MainView();
          } else {
            return const LoginView();
          }
        },
      ),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main view',
          style: TextStyle(),
        ),
      ),
      body: Consumer(builder: (context, ref, _) {
        return Center(
          child: TextButton(
            onPressed: () async {
              await ref.read(authStateProvider.notifier).logOut();
            },
            child: const Text(
              'Log out',
            ),
          ),
        );
      }),
    );
  }
}
