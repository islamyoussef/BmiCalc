import 'package:blackhourses/models/news_cloud_models/news_category.dart';
import 'package:flutter/material.dart';

class CustomCategory extends StatelessWidget {

  const CustomCategory({super.key, required this.category});

  final NewsCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 225,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: NetworkImage(category.catImagePath), fit: BoxFit.cover)
      ),
      child: Container(
        width: double.infinity,
        //height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(0, 0, 0, 0.5), // Specifies the background color and the opacity
        ),
        child: Center(
          child: Text(
            category.catName.toString(),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
