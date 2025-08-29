import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthState {
  final bool loading;
  final String? error;
  AuthState({this.loading = false, this.error});
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  final supabase = Supabase.instance.client;




  Future<bool> login(String email, String password) async {
  try {
    final res = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    print("Login success: ${res.session?.accessToken}");
    return res.user != null;
  } catch (e) {
    print("Error during login: $e");
    return false;
  }
}


  Future<bool> signup(String email, String password) async {
    state = AuthState(loading: true);
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (response.user == null || (response.user?.identities?.isEmpty ?? true)) {
        state = AuthState(error: "User already exists or signup failed.");
        return false;
      }
      state = AuthState();
      return true;
    } on AuthException catch (e) {
      state = AuthState(error: e.message);
      return false;
    }
  }
}