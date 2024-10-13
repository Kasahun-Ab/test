import 'package:firebase_auth/firebase_auth.dart';
import '../models/phone_model.dart';

class FirebasePhoneAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? _verificationId;

  Future<Result<void>> sendOTP(
      String phoneNumber, Null Function(dynamic verificationId) param1) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw Exception(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
      return Result<void>(data: null);
    } catch (e) {
      return Result<void>(error: e.toString());
    }
  }

  Future<Result<void>> verifyOTP(String otp, [String? s]) async {
    try {
      if (_verificationId == null) {
        return Result<void>(error: "Verification ID is null");
      }

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
      return Result<void>(data: null);
    } catch (e) {
      return Result<void>(error: e.toString());
    }
  }
}
