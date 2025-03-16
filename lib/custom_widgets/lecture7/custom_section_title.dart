import 'package:flutter/material.dart';

class CustomSectionTitle extends StatelessWidget {
  const CustomSectionTitle({super.key, required this.sectionTitle});

  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    // Section Title
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(children: [
        const Icon(Icons.arrow_right_rounded),
        Text(
          sectionTitle.toString(),
          style: const TextStyle(
              color: Colors.orangeAccent,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ]),
    );
  }
}
