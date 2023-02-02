import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_gram_riverpod/firebase_options.dart';
import 'package:insta_gram_riverpod/state/auth/providers/is_logged_provider.dart';
import 'package:insta_gram_riverpod/state/providers/loading_provider.dart';
import 'package:insta_gram_riverpod/views/components/loading/loading_screen.dart';
import 'package:insta_gram_riverpod/views/main/main_view.dart';

import 'views/login/login_view.dart';

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
        builder: (BuildContext context1, WidgetRef ref, Widget? child) {
          ref.listen<bool>(loadingProvider, (_, isLoading) {
            if (isLoading) {
              LoadingScreen.instance().show(context: context1);
            } else {
              LoadingScreen.instance().hide();
            }
          });
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
