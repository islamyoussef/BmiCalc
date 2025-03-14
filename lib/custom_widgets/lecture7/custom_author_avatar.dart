import 'package:flutter/material.dart';

class CustomAuthorAvatar extends StatelessWidget {
  const CustomAuthorAvatar({super.key, required this.authorName, required this.authorImagePath});

  final String authorImagePath;
  final String authorName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(authorImagePath.toString() ??
                  'assets/images/islam.jpg'),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
          width: 35.0,
          height: 35.0,
        ),
        const SizedBox(
          width: 5,
        ),

        Text(
          authorName ?? 'Islam A,Youssef',
          style: const TextStyle(
              color: Colors.orange,
              fontSize: 13,
              fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}
