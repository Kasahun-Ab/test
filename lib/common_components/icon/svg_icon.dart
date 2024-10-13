import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
      {super.key,
      required this.icon,
      this.width ,
      this.height ,
      this.color,
      
      });
  final String icon;
  final double? width;
  final double? height;
  final Color? color;
  

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: width??50,
      height: height??50,
      // ignore: deprecated_member_use
      color:color,
    );
  }
}
