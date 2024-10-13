// // phone_auth_cubit.dart
// // ignore: depend_on_referenced_packages
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import '../repositories/phone_auth_repostories.dart';
// import './index.dart';

// class PhoneAuthCubit extends Cubit<PhoneAuthState> {
//   final FirebasePhoneAuthRepository _repository;
//   String? _verificationId;

//   PhoneAuthCubit(this._repository) : super(PhoneAuthInitial());

//   Future<void> sendOTP(String phoneNumber) async {
//     emit(PhoneAuthInitial());
//     try {
//       await _repository.sendOTP(phoneNumber, (verificationId) {
//         _verificationId = verificationId;
//         emit(PhoneAuthCodeSent());
//       });
//     } catch (e) {
//       emit(PhoneAuthError(e.toString()));
//     }
//   }

//   Future<void> verifyOTP(String otp) async {
//     if (_verificationId == null) {
//       emit(PhoneAuthError("Verification ID is null"));
//       return;
//     }

//     try {
//       await _repository.verifyOTP(otp, _verificationId!);
//       emit(PhoneAuthVerified());
//     } catch (e) {
//       emit(PhoneAuthError(e.toString()));
//     }
//   }

//   void validatePhoneNumber(GlobalKey<FormState> formkey, BuildContext context,
//       PhoneNumber number, TextEditingController controller) {
//     String countryCode = number.dialCode ?? '';
//     String phoneNumber = controller.text.trim(); 
//     String newPhone = phoneNumber.replaceAll(
//         RegExp(r'\s+'), ''); 

//     // Basic phone number length check, customize based on your use case
//     if (countryCode.isNotEmpty && newPhone.isNotEmpty && newPhone.length >= 8) {
//       if (formkey.currentState!.validate()) {
//         // Additional custom validation logic
//         final bool isValid = _isValidPhoneNumber(newPhone, countryCode);

//         if (isValid) {
         
//           emit(PhoneFormValidation(true));
//         } else {
       
//           emit(PhoneFormValidation(false));
//         }
//       } else {
//         emit(PhoneFormValidation(false));
//       }
//     } else {
//       emit(PhoneFormValidation(false));
//     }
//   }

// // Custom method for checking if the phone number is valid
//   bool _isValidPhoneNumber(String phoneNumber, String countryCode) {
//     final String fullPhone = countryCode + phoneNumber;

//     // You can implement a custom phone number regex validator here
//     // Example simple check for digits, should be adapted to actual phone validation logic
//     final RegExp phoneRegex = RegExp(r'^\+?\d{8,15}$');

//     return phoneRegex.hasMatch(fullPhone);
//   }
// }
