import 'package:flutter/material.dart';

class Task4 extends StatelessWidget {
  const Task4({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.brown, borderRadius: BorderRadius.circular(5)),
        child: const Center(
          child: Text("12:45 PM",
              style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold)
          ),
        ),),
      );
  }

}
