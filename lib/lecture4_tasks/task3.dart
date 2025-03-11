import 'package:flutter/material.dart';

class Task3 extends StatelessWidget {
  const Task3({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.lightBlue, borderRadius: BorderRadius.circular(5)),
        child: Row(
           children: [
            // My image
            Container(
              margin: const EdgeInsets.only(right: 5.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/MyImage.png'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: 100.0,
              height: 100.0,
            ),

            // My Info
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textInfo("Name: Islam A,Youssef"),
                  textInfo("Job Title: .Net Developer"),
                  textInfo("Mobile: 01228351303")
                ],
              ),
          ],
        ),
      ),
    );
  }

  // text info method
  Container textInfo(String info) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: Text(info,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold)

      ),
    );
  }
}
