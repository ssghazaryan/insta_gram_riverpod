import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../state/auth/providers/auth_state_provider.dart';
import '../../views/constants/app_colors.dart';
import '../../views/login/google_button.dart';
import '../components/strings.dart';
import 'login_view_sign_up_links.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.appName,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 40,
              ),
              // header text
              Text(
                Strings.welcomeToAppName,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Divider(),
              ),
              Text(
                Strings.logIntoYourAccount,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(height: 1.5),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.loginButtonColor,
                  foregroundColor: AppColors.loginButtonTextColor,
                ),
                onPressed: ref.read(authStateProvider.notifier).logInWithGoogle,
                child: const GoogleButton(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Divider(),
              ),
              const LoginViewSignupLinks(),
            ],
          ),
        ),
      ),
    );
  }
}
