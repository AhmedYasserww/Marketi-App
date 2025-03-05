
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xff3F80FF),
            shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(15),
        )),
          onPressed:onPressed,
          child:Text(text,style: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500) ,),)
    );
  }
}
