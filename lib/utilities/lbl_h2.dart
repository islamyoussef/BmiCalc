import 'package:flutter/material.dart';

class H2 extends StatelessWidget {

  final String? txt;
  final Color? txtColor;

  const H2({Key? key, required this.txt, this.txtColor}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Text(txt!,
      style: TextStyle(
          color: txtColor ?? Colors.orange,
          fontSize: 25,
          fontWeight: FontWeight.bold
      ),);
  }
}
