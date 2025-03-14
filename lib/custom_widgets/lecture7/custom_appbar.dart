
import 'package:flutter/material.dart';

class CustomAppBar{

  static AppBar customAppbar(){
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "News",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
          Text(
            "Cloud",
            style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}