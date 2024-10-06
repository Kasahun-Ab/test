import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../cubit/phoneauth_cubit.dart';

class MobileAuthPage extends StatefulWidget {
  const MobileAuthPage({super.key});

  @override
  State<MobileAuthPage> createState() => _MobileAuthPageState();
}

class _MobileAuthPageState extends State<MobileAuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  // Default to initial country
  bool isValidPhoneNumber = true;

  void validatePhoneNumber(String phone) {
    if (_formKey.currentState!.validate()) {
      context.read<PhoneAuthCubit>().sendOTP(phone);
    } else {
      setState(() {
        isValidPhoneNumber = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // String initialCountry = 'ET';
    PhoneNumber number = PhoneNumber(isoCode: 'ET', dialCode: "+251");
    // Debugging line to check dial code
    return Scaffold(
      backgroundColor: const Color(0xfff9faff),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 4,
              backgroundColor: Colors.white,
              child: Icon(CupertinoIcons.back),
            ),
          ),
        ),
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/SVG/title.svg',
          // ignore: deprecated_member_use
          color: const Color(0xFF3072fd),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    "Let's get started!",
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: 20.sp,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Enter your phone number. We will send you a confirmation code.",
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  const SizedBox(height: 15),
                  InternationalPhoneNumberInput(
                    inputDecoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black87),
                            borderRadius: BorderRadius.circular(15)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black45),
                            borderRadius: BorderRadius.circular(15))),
                    onInputChanged: (PhoneNumber inputNumber) {
                      setState(() {
                        number = inputNumber;
                      });
                    },
                    onInputValidated: (bool value) {
                      setState(() {
                        isValidPhoneNumber = value;
                      });
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      useBottomSheetSafeArea: true,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    selectorTextStyle: const TextStyle(color: Colors.black),
                    initialValue: number,
                    textFieldController: controller,
                    formatInput: true,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: false),
                    inputBorder: const OutlineInputBorder(),
                    errorMessage: isValidPhoneNumber
                        ? null
                        : 'Please enter a valid phone number',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              BlocListener<PhoneAuthCubit, PhoneAuthState>(
                listener: (context, state) {
                  if (state is PhoneAuthCodeSent) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Verification code sent!')),
                    );
                  } else if (state is PhoneAuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  } else if (state is PhoneAuthVerified) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: const Color(0xFF3072fd),
                      ),
                      onPressed: () {
                        String countryCode = number.dialCode ?? '';
                        String phoneNumber = controller.text;
                        String newPhone =
                            phoneNumber.replaceAll(RegExp(r'\s+'), '');

                        if (countryCode.isNotEmpty && newPhone.isNotEmpty) {
                          String formattedNumber = '$countryCode$newPhone';
                          print(formattedNumber);
                          validatePhoneNumber(formattedNumber);
                          Navigator.pushNamed(context, '/otppage');
                        } else {}
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
