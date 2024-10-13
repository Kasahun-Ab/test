import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/cubit/auth_state.dart';
import 'package:testapp/repositories/auth_repostories.dart';
import 'package:testapp/models/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoty _authRepositoty;
  AuthCubit(this._authRepositoty) : super(AuthInitial());

  Future<void> login(String email, String password) async {
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
  // void validateForm(String email, String password) {
  //   if (email.isEmpty) {
  //     emit(FormValidationError("Email cannot be empty"));
  //   } else if (!email.contains('@')) {
  //     emit(FormValidationError("Invalid email format"));
  //   } else if (password.isEmpty) {
  //     emit(FormValidationError("Password cannot be empty"));
  //   } else if (password.length < 6) {
  //     emit(FormValidationError("Password must be at least 6 characters"));
  //   } else {
  //     emit(FormValid()); // Everything is valid
  //   }
  // }
}
