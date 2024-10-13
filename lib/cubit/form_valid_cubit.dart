import 'package:bloc/bloc.dart';
import './form_valid_state.dart';

class FormCubit extends Cubit<AuthFormValid> {
  FormCubit() : super(FormInitial());

  void validateForm(String email, String password) {
    if (email.isEmpty) {
      emit(AuthFormValidError("Email cannot be empty"));
    } else if (!email.contains('@')) {
      emit(AuthFormValidError("Invalid email format"));
    } else if (password.isEmpty) {
      emit(AuthFormValidError("Password cannot be empty"));
    } else if (password.length < 6) {
      emit(AuthFormValidError("Password must be at least 6 characters"));
    } else {
      emit(FormValid()); 
    }
  }
}
