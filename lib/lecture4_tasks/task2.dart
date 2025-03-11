import 'package:flutter/material.dart';

class Task2 extends StatelessWidget {
  const Task2({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 450,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              trafficLightsColors(containerColor: Colors.red),
              trafficLightsColors(containerColor: Colors.yellow),
              trafficLightsColors(containerColor: Colors.green),
            ],
          ),
        ),
      ),
    );
  }

  // Container methods
  Container trafficLightsColors({required Color containerColor}){
    return Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(50), // Adjust the radius as needed
        ),
      child: null,
    ) ;
  }}
