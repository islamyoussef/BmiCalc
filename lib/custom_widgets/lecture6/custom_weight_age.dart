import 'package:flutter/material.dart';

class CustomWeightAge extends StatelessWidget {
  CustomWeightAge(
      {super.key,
      required this.type,
      required this.number,
      this.bgColor,
      required this.increment,
      required this.decrement});

  final int number;
  final String type;
  Color? bgColor;
  final VoidCallback increment;
  final VoidCallback decrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? const Color(0xff24263b),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 155.0,
      height: 180.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type,
            style: const TextStyle(
                color: Color(0xff8B8C9E),
                fontSize: 20,
                fontWeight: FontWeight.w300),
          ),
          Text(
            number.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: decrement,
                child: Container(
                  width: 40,
                  height: 42,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff8b8c9e),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ]),
                  child: const Icon(Icons.minimize, color: Colors.white),
                ),
              ),
              InkWell(
                onTap: increment,
                child: Container(
                  width: 40,
                  height: 42,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff8b8c9e),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ]),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
