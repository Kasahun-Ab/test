import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_components/index.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.1,
          child: Image(
            filterQuality: FilterQuality.high,
            height: 240.h,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            image: const AssetImage("assets/images/worldMap.png"),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: CircleAvatar(
              radius: 40.sp,
              backgroundColor: const Color(0xFFf1b202),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: HeroText(
                title: "Welecome to Register",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
