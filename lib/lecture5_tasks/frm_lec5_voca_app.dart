
import 'package:blackhourses/utilities/lbl_header1.dart';
import 'package:flutter/material.dart';
import '../utilities/appbar.dart';

class FrmLec5VacaApp extends StatelessWidget {
  FrmLec5VacaApp({super.key});

  CustomAppBar myAppBar = CustomAppBar(title: "Voca App");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar.appBarTitle(),
      body: Column(
        children: [
          btnCategory("Numbers", Colors.blueGrey, "/Lec5VocaNum", context),
          btnCategory("Family Members", Colors.redAccent, "/Lec5VocaFamily",context),
          btnCategory("Colors", Colors.green, "/Lec5VocaColor",context),
        ],
      ),
    );
  }

  Widget btnCategory(String catName, Color catColor, String catScreen,BuildContext ctx){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(ctx, catScreen);
        //Navigator.of(context).pushNamed(catScreen);
      },
      child: Container(
        width: double.infinity,
        height: 100,
        color: catColor,
        child: Center(child: H1(txt: catName, txtColor: Colors.white)),
      ),
    );
  }

}
