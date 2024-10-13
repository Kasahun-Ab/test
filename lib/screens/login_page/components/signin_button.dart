import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/index.dart';
import 'package:testapp/common_components/index.dart';

class SigninButton extends StatelessWidget {
  const SigninButton(
      {super.key, required this.title, this.fromkey, required this.ontap});
  final String title;
  final GlobalKey<FormState>? fromkey;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormCubit, AuthFormValid>(builder: (context, state) {
      bool isValidate = false;
      if (state is FormValid) {
        isValidate = true;
      }

      return CustomButton(
        backgroundColor: Colors.amber,
        ontap: isValidate ? ontap : null,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(),
          ),
        ),
      );
    });
  }
}
