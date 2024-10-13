import 'package:flutter/material.dart';

class DividerWitText extends StatelessWidget {
  const DividerWitText({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 2,
            width: size / 2.5,
            color: const Color(0x00f5f5f5),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "or",
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 2,
            width: size / 2.5,
            color: const Color(0x00f5f5f5),
          ),
        ],
      ),
    );
  }
}
