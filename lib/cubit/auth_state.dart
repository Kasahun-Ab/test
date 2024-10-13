abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthLogout extends AuthState {}

class AuthFailuers extends AuthState {
  final String messages;
  AuthFailuers(this.messages);
}


