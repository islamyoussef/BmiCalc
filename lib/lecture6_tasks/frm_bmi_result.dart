import 'package:flutter/material.dart';

class FrmBmiResult extends StatelessWidget {
  const FrmBmiResult({super.key, required this.resultText, required this.resultNumber, required this.resultMsg, required this.resultColor});

  static double screenWidth = double.infinity;

  final String resultText;
  final double resultNumber;
  final Color resultColor;
  final String resultMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c2135),
      appBar: AppBar(
        backgroundColor: const Color(0xff24263B),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            // Section 1 → Header
            const Text("Your Result", style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),),

            // Section 2 → Result Details
            Container(
              decoration: BoxDecoration(
                color:  const Color(0xff333244),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity * 0.75,
              height: 500,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Text
                  Text(
                    resultText,
                    style: TextStyle(
                        color: resultColor,
                        fontSize: 35,
                        fontWeight: FontWeight.w700),
                  ),

                  // Number
                  Text(
                    resultNumber.toStringAsFixed(1),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        fontWeight: FontWeight.w700),
                  ),

                  // long statement
                  Text(
                    resultMsg,
                    style: const TextStyle(
                        color:  Color(0xff8b8c9e),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),


                ],
              ),

            ),

            // Button Result
            InkWell(
              onTap: (){
                Navigator.popAndPushNamed(context, '/Lec6Bmi');
              },
              child: Container(
                width: double.infinity,
                height: 100,
                color: const Color(0xffE83D67),
                child: const Center(
                  child: Text("Re-Calculate", style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600
                  ),
                  ),
                ),


              ),
            )

          ],
        ),
      ),
    );
  }
}
