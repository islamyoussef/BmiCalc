import 'package:flutter/material.dart';

class CustomAuthorAvatar extends StatelessWidget {
  const CustomAuthorAvatar(
      {super.key,
      required this.publishedAt,
      required this.authorName,
      required this.authorImagePath});

  final String authorImagePath;
  final String authorName;
  final DateTime publishedAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              Container(
                width: 35.0,
                height: 35.0,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(authorImagePath.toString()),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 150,
                child: Text(
                  authorName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 13,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),

          Text('${publishedAt.day}-${publishedAt.month}-${publishedAt.year}',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black45
          ),)

        ],
      ),
    );
  }
}
