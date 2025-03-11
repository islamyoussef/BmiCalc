import 'package:flutter/material.dart';

class CustomGender extends StatelessWidget {

  CustomGender({super.key,required this.gender, required this.imagePath, this.bgColor});

  final String imagePath;
  final String gender;
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? const Color(0xff24263b),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 155.0,
      height: 180.0,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 144,
            width: 144,
            fit: BoxFit.contain,
          ),
          Text(
            gender,
            style: const TextStyle(
                color: Color(0xff8B8C9E),
                fontSize: 20,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
