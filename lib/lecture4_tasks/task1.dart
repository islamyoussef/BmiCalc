import 'package:flutter/material.dart';

class Task1 extends StatelessWidget {
  const Task1({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            coloredContainer(hw: 50, containerColor: Colors.blue,colorName: "Blue"),
            coloredContainer(hw: 75, containerColor: Colors.redAccent, colorName:"Red"),
            coloredContainer(hw: 100, containerColor: Colors.green, colorName:"Green"),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            coloredContainer(hw: 100, containerColor: Colors.orange,colorName: "Orange"),
            coloredContainer(hw: 75, containerColor: Colors.grey, colorName:"Grey"),
            coloredContainer(hw: 50, containerColor: Colors.cyan, colorName:"Cyan"),
          ],
        )
      ],
    );
  }

  // Container methods
  Container coloredContainer({required double hw,required Color containerColor,required String colorName}){
    return Container(
        height: hw,
        width: hw,
        color: containerColor,
        child: Center(
          child: Text(colorName, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
        )
    ) ;
  }

}
