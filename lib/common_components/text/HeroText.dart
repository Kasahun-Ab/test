
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroText extends StatelessWidget {
  const HeroText({
    super.key,
    required this.title, 
    this.style,
  });

  final String title;
  final TextStyle? style; 

  @override
  Widget build(BuildContext context) {
    return Text(
    title,
      style:style?? Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 20.sp),
    );
  }
}