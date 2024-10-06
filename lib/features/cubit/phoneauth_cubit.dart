// phone_auth_cubit.dart
import 'package:bloc/bloc.dart';
import '../repostories/phoneauth_repostories.dart';

// States
class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthCodeSent extends PhoneAuthState {}

class PhoneAuthVerified extends PhoneAuthState {}

class PhoneAuthError extends PhoneAuthState {
  final String message;
  PhoneAuthError(this.message);
}

// Cubit
class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final FirebasePhoneAuthRepository _repository;
  String? _verificationId;

  PhoneAuthCubit(this._repository) : super(PhoneAuthInitial());

  Future<void> sendOTP(String phoneNumber) async {
    emit(PhoneAuthInitial());
    try {
      await _repository.sendOTP(phoneNumber, (verificationId) {
        _verificationId = verificationId;
        emit(PhoneAuthCodeSent());
      });
    } catch (e) {
      emit(PhoneAuthError(e.toString()));
    }
  }

  Future<void> verifyOTP(String otp) async {
    if (_verificationId == null) {
      emit(PhoneAuthError("Verification ID is null"));
      return;
    }

    try {
      await _repository.verifyOTP(otp, _verificationId!);
      emit(PhoneAuthVerified());
    } catch (e) {
      emit(PhoneAuthError(e.toString()));
    }
  }
}
