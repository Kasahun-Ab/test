import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.ontap,
      required this.child,
      this.padding,
      this.height,
      this.width,
      this.backgroundColor,
      this.shape,
      this.disbledcolor});

  final Widget child;
  final dynamic ontap;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final OutlinedBorder? shape;
  final Color? disbledcolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: height ?? 50.h,
        width: width ?? double.infinity,
        child: ElevatedButton(
            onPressed: ontap,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? Colors.white,
              disabledBackgroundColor: disbledcolor,
              shape: shape ??
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
            ),
            child: child),
      ),
    );
  }
}
