import 'package:flutter/material.dart';

class H1 extends StatelessWidget {

  final String? txt;
  final Color? txtColor;

  const H1({Key? key, required this.txt, this.txtColor}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Text(txt!,
      style: TextStyle(
        color: txtColor ?? Colors.orange,
        fontSize: 30,
        fontWeight: FontWeight.bold
    ),);
  }
}
