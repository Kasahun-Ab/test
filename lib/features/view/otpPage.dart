import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          color: const Color(0xFF3072fd),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter Code",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 20.sp,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter the code that we have sent to  +2519*******00 ",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 15.sp,
                      ),
                ),
                const SizedBox(
                  height: 30,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  onChanged: (value) {
                    setState(() {});
                  },
                  cursorColor: Colors.blue,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    inactiveFillColor: Colors.white,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveColor: Colors.blue,
                    activeColor: Colors.blue,
                    selectedColor: Colors.blue,
                    errorBorderColor: Colors.red,
                    borderWidth: 1.5,
                  ),
                ),
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
                    'Verify code',
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
    );
  }
}
