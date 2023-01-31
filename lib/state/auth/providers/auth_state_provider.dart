import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_gram_riverpod/state/auth/models/auth_state.dart';
import 'package:insta_gram_riverpod/state/auth/notifires/auth_state_notifire.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (_) => AuthStateNotifier(),
);
