import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/apiservices/login_service.dart';

 
 class LoginState {
   final String token;
   final bool isLoading;
   final String errorMessage;
 
   LoginState({this.token = '', this.isLoading = false, this.errorMessage = ''});
 
   LoginState copywith({
     String? token,
     bool? isLoading,
     String? errorMessage,
   }) {
     return LoginState(
       isLoading: isLoading ?? this.isLoading,
       errorMessage: errorMessage ?? this.errorMessage,
       token: token ?? this.token,
     );
   }
 }
 
 class LoginProvider extends StateNotifier<LoginState> {
  final ApiServices apiServices;

  LoginProvider(this.apiServices) : super(LoginState());

  Future<bool> login(String username, String password) async {
    state = state.copywith(isLoading: true, errorMessage: '');

    try {
      final token = await apiServices.login(username, password);

      if (token.isNotEmpty) {
        state = state.copywith(isLoading: false, token: token);
        return true; 
      } else {
        state = state.copywith(
          isLoading: false,
          errorMessage: 'Invalid credentials',
        );
        return false; 
      }
    } catch (e) {
      state = state.copywith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }
}

 
 final loginProvider = StateNotifierProvider<LoginProvider, LoginState>(
   (ref) => LoginProvider(ApiServices()),
 );