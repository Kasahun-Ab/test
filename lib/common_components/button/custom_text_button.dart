import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
   const CustomTextButton({super.key,required this.child,required this.ontap, this.style});
 
  final Widget child;
  final Function  ()? ontap; 
 final ButtonStyle? style;
  @override
  Widget build(BuildContext context) {

    return  TextButton(
      
      style: style,
      onPressed: () {  }, 
      
      child:child ,
    
    );
  }
}