import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/features/cubit/auth_state.dart';
import 'package:testapp/features/repostories/auth_repostories.dart';
import 'package:testapp/features/models/UserModel.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoty _authRepositoty;
  AuthCubit(this._authRepositoty) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    print("${email}$password");
    try {
      emit(AuthLoading());

      UserModel? user = await _authRepositoty.login(email, password);

      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailuers("Login failed"));
      }
    } catch (e) {
      emit(AuthFailuers("login failure from this Error ,$e"));
    }
  }

  Future<void> register(String email, String password) async {
    try {
      emit(AuthLoading());
      UserModel? user = await _authRepositoty.register(email, password);

      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailuers("Register failed"));
      }
    } catch (e) {
      emit(AuthFailuers("Sign up failure from this Error ,$e"));
    }
  }

  Future<void> signinWithGoogle() async {
    emit(AuthLoading());
    try {
      UserModel? user = await _authRepositoty.signinWithGoogle();
      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailuers("Sign in with Google Fail"));
      }
    } catch (e) {
      emit(AuthFailuers("Sign in with Google $e"));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    await _authRepositoty.logout();

    emit(AuthLogout());
  }

  validateForm(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      emit(AuthFormValid(true));
    } else {
      emit(AuthFormValid(false));
    }
  }
}
