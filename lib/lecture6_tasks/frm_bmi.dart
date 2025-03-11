import 'dart:ui';

import 'package:blackhourses/custom_widgets/lecture6/custom_gender.dart';
import 'package:blackhourses/lecture6_tasks/frm_bmi_result.dart';
import 'package:blackhourses/models/bmi_calculator.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/lecture6/custom_weight_age.dart';

class FrmBmi extends StatefulWidget {
  const FrmBmi({super.key});

  @override
  State<FrmBmi> createState() => _BmiState();
}

class _BmiState extends State<FrmBmi> {

  Map<String, dynamic> bmiResult = <String, dynamic>{};
  double height = 150;
  int age = 15;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c2135),
      appBar: AppBar(
        backgroundColor: const Color(0xff24263B),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Section 1 → Gender
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomGender(
                    gender: "Male", imagePath: "assets/images/lec6/male.png"),
                CustomGender(
                    gender: "Female",
                    imagePath: "assets/images/lec6/female.png",
                    bgColor: const Color(0xff333244))
              ],
            ),

            // Section 2 → Height , cm , slider
            const Text(
              "Height",
              style: TextStyle(
                  color: Color(0xff8B8C9E),
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  height.toStringAsFixed(0),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
                const Text(
                  "cm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )
              ],
            ),

            Slider(
              value: height,
              min: 0,
              max: 300,
              activeColor: const Color(0xffE83D67),
              onChanged: (double value) {
                setState(() {
                  height = value;
                });
              },
            ),

            // Section 3 → Weight & Age
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomWeightAge(
                  type: "Age",
                  number: age,
                  increment: () {
                    setState(() {
                      age++;
                    });
                  },
                  decrement: () {
                    setState(() {
                      age--;
                    });
                  },
                ),
                CustomWeightAge(
                    type: "Weight",
                    number: weight,
                    increment: () {
                      setState(() {
                        weight++;
                      });
                    },
                    decrement: () {
                      setState(() {
                        weight--;
                      });
                    },
                    bgColor: const Color(0xff333244))
              ],
            ),

            // Section 4 → Button Result
            InkWell(
              onTap: () {
                //Navigator.pushNamed(context, '/Lec6BmiResult',arguments: [resultText: "",]);
                double bmi = BmiCalculate.getBMI(
                    weightKg: weight.toDouble(), heightCm: height.toDouble());

                bmiResult = BmiCalculate.getBmiRange(bmi);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FrmBmiResult(
                              resultText: bmiResult['title'],
                              resultNumber: bmi,
                              resultMsg: bmiResult['msg'],
                              resultColor: bmiResult['color'],
                            )));
              },
              child: Container(
                width: double.infinity,
                height: 100,
                color: const Color(0xffE83D67),
                child: const Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
