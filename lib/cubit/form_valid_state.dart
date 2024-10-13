
abstract class AuthFormValid {}

class FormInitial extends AuthFormValid {}

class FormValid extends AuthFormValid {}



class AuthFormValidError extends AuthFormValid {
  final String message;
  AuthFormValidError(this.message);
}

