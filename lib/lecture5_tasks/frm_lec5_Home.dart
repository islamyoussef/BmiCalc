import 'package:blackhourses/utilities/btn_elevated.dart';
import 'package:blackhourses/utilities/lbl_header1.dart';
import 'package:flutter/material.dart';

class FrmLec5Home extends StatelessWidget {
  const FrmLec5Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const H1(txt: "Lecture 5"),
            const H1(txt: "Tasks Navigator"),
            const SizedBox(height: 35),

            BtnElevated(text: "Task 1 - Modern Card", onPressed: (){
              Navigator.pushNamed(context, '/lec5ModernCard');
            }),
            const SizedBox(height: 30),

            BtnElevated(text: "Task 2 - Points Counter",onPressed: (){
              Navigator.pushNamed(context, '/Lec5PointsCounter');
            }),
            const SizedBox(height: 30),

            BtnElevated(text: "Task 3 - Vocabulary Notes", onPressed: (){
              Navigator.pushNamed(context, '/Lec5VocaApp');
            }),
          ],
        ),
      ),
    );
  }
}
