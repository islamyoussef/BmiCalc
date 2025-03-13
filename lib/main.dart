import 'package:blackhourses/lecture5_tasks/frm_lec5_modern_card.dart';
import 'package:blackhourses/lecture5_tasks/frm_lec5_points_counter.dart';
import 'package:blackhourses/lecture5_tasks/frm_lec5_voca_app.dart';
import 'package:blackhourses/lecture5_tasks/frm_lec5_Home.dart';
import 'package:blackhourses/lecture5_tasks/frm_lec5_voca_family.dart';
import 'package:blackhourses/lecture6_tasks/frm_bmi.dart';
import 'package:blackhourses/lecture6_tasks/frm_bmi_result.dart';
import 'package:flutter/material.dart';
import 'home_navigator.dart';
import 'lecture5_tasks/frm_lec5_voca_colors.dart';
import 'lecture5_tasks/frm_lec5_voca_numbers.dart';
import 'lecture7_tasks/frm_home_news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff24263B)),
        useMaterial3: true,
      ),
      initialRoute: '/Navigator',
      routes: {
        '/Navigator' : (context) => const FrmNavigator(),

        '/lec5Home' : (context) => const FrmLec5Home(),
        '/lec5ModernCard' : (context) => const FrmLec5ModernCard(),
        '/Lec5PointsCounter' : (context) => const FrmLec5PointsCounter(),
        '/Lec5VocaApp' : (context) => FrmLec5VacaApp(),
        '/Lec5VocaNum' : (context) => FrmLec5VacaNumbers(),
        '/Lec5VocaFamily' : (context) => FrmLec5VacaFamily(),
        '/Lec5VocaColor' : (context) => FrmLec5VacaColor(),

        '/Lec6Bmi' : (context) => const FrmBmi(),
        //'/Lec6BmiResult' : (context) => const FrmBmiResult(),

        '/Lec7HomeNews' : (context) => const FrmHomeNews(),
      },
      //home: const MyHomePage(title: 'Lecture 4 - Task 4-4'),
      home: const FrmLec5Home(),
    );
  }
}
