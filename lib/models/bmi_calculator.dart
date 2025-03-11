import 'package:flutter/material.dart';

class BmiCalculate{

  static double getBMI({required double weightKg, required double heightCm} ){

    // BMI = weight ÷ (height in meter ^2)
    double bmi = 0;
    double heightInMeter = (heightCm / 100);

    bmi = weightKg / (heightInMeter * heightInMeter);

    return bmi;
  }

  static Map<String,dynamic> bmiResult = <String,dynamic>{};

  static Map<String,dynamic> getBmiRange(double bmi) {
    if (bmi < 18.5) {
      bmiResult = {
        'title': 'Very Thin',
        'msg': 'You\'r very thin you should eat more.' ,
        'color': Colors.cyan,
      };

    } else if (bmi >= 18.5 && bmi < 25) {
      bmiResult = {
        'title': 'Normal',
        'msg': 'You\'ve a normal body weight, \n Good Job.' ,
        'color': Colors.green,
      };

    } else if (bmi >= 25 && bmi < 30) {
      bmiResult = {
        'title': 'Up-Normal',
        'msg': 'You\'ve an up-normal body weight, \n Try to workout.' ,
        'color': Colors.orange,
      };

    } else if (bmi >= 30 && bmi < 35) {
      bmiResult = {
        'title': 'Over Weight',
        'msg': 'You\'re an over weight person, \n Diet is important to you.' ,
        'color': Colors.red,
      };

    } else {
      bmiResult = {
        'title': 'Morbid Obesity',
        'msg': '...................',
        'color': Colors.purpleAccent,
      };

    }

    return bmiResult;
  }

}