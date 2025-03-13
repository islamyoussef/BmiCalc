import 'package:blackhourses/utilities/btn_elevated.dart';
import 'package:blackhourses/utilities/lbl_header1.dart';
import 'package:flutter/material.dart';

import 'utilities/btn_elevated.dart';
import 'utilities/lbl_header1.dart';

class FrmNavigator extends StatelessWidget {
  const FrmNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const H1(txt: "Black Horses"),
            const H1(txt: "Tasks Navigator"),
            const SizedBox(height: 35),

            BtnElevated(text: "Lecture 5",backgroundColor: Colors.redAccent, onPressed: (){
              Navigator.pushNamed(context, '/lec5Home');
            }),
            const SizedBox(height: 30),

            BtnElevated(text: "Lecture 6 - BMI Calc",onPressed: (){
              Navigator.pushNamed(context, '/Lec6Bmi');
            }),
            const SizedBox(height: 30),

            BtnElevated(text: "Lecture 7 - News App",backgroundColor: Colors.green, onPressed: (){
              Navigator.pushNamed(context, '/Lec7HomeNews');
            }),
          ],
        ),
      ),
    );
  }
}
