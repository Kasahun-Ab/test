import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../common_components/index.dart';
import '../../cubit/index.dart';

class MobileAuthPage extends StatefulWidget {
  const MobileAuthPage({super.key});

  @override
  State<MobileAuthPage> createState() => _MobileAuthPageState();
}

class _MobileAuthPageState extends State<MobileAuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  bool isValidPhoneNumber = false;

  @override
  Widget build(BuildContext context) {
    PhoneNumber number = PhoneNumber(isoCode: 'ET', dialCode: "+251");

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
          child: BlocListener(
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

              if (state is PhoneFormValidation == false) {
                isValidPhoneNumber = true;

                setState(() {});
              } else {
                isValidPhoneNumber = false;

                setState(() {});
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const HeroText(title: "Let`s get started!"),
                    const SizedBox(height: 10),
                    // HeaderText(
                    //   align: TextAlign.left,
                    //   horizontal: 0,
                    //   message:
                    //       'Enter your phone number. We will send you a confirmation code.',
                    // ),
                    const SizedBox(height: 15),
                    InternationalPhoneNumberInput(
                      inputDecoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(15)),
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black45),
                              borderRadius: BorderRadius.circular(15))),
                      onInputChanged: (val) {
                        // context.read<PhoneAuthCubit>().validatePhoneNumber(
                        //     _formKey, context, val, controller);
                      },
                      onInputValidated: (bool value) {},
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
                Padding(
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
                      onPressed: () {},
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
