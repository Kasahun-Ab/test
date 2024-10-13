class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthCodeSent extends PhoneAuthState {}

class PhoneAuthVerified extends PhoneAuthState {}

class PhoneAuthError extends PhoneAuthState {
  final String message;
  PhoneAuthError(this.message);
}

class PhoneFormValidation extends PhoneAuthState {
  final bool formvalidate;
  PhoneFormValidation(this.formvalidate);
}
