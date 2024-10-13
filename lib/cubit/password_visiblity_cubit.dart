import 'package:bloc/bloc.dart';
import 'password_visiblity_state.dart';
class PasswordVisiblityCubit extends Cubit<PasswordVisiblityState>{
  PasswordVisiblityCubit():super(PasswordHidden());
  void tooglePasswordVisiblity(){
if(state is PasswordHidden){
emit(PasswordVisible());
}
else{
  emit(PasswordHidden());
}
  }
}