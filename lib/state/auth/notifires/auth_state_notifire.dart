import 'package:insta_gram_riverpod/state/auth/backend/authenticator.dart';
import 'package:insta_gram_riverpod/state/auth/models/auth_result.dart';
import 'package:insta_gram_riverpod/state/auth/models/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_gram_riverpod/state/user_info/backend/user_info_storage.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authtificator = const Authenticator();
  final _userInfoStrotage = const UserInfoStorage();

  AuthStateNotifier() : super(const AuthState.uknown()) {
    if (_authtificator.isAlreadyLogged) {
      state = AuthState(
        result: AuthResult.success,
        isLoading: false,
        userId: _authtificator.userId,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authtificator.logOut();
    state = const AuthState.uknown();
  }

  Future<void> logInWithGoogle() async {
    state = state.copiedWithIsLoading(true);

    final result = await _authtificator.loginWithGoogle();
    final userId = _authtificator.userId;

    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(
        userId: userId,
      );
    }
    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }

  Future<void> saveUserInfo({required String userId}) =>
      _userInfoStrotage.saveUserInfo(
        userId: userId,
        displayName: _authtificator.displayName,
        email: _authtificator.email,
      );
}
