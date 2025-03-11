import 'package:blackhourses/utilities/lbl_header1.dart';
import 'package:flutter/material.dart';

class FrmLec5ModernCard extends StatelessWidget {
  const FrmLec5ModernCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Avatar image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/islam.jpg'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: 175.0,
              height: 175.0,
            ),

            const SizedBox(height: 25,),
            const H1(txt: 'Islam A,Youssef'),
            const SizedBox(height: 25,),
            const H1(txt: 'Flutter Developer'),
            const SizedBox(height: 25,),
            const H1(txt: '01228351303'),
            const SizedBox(height: 25,),
            const H1(txt: 'islamyoussef83@gmail.com'),
            const SizedBox(height: 50,),
            OutlinedButton(onPressed: (){
              Navigator.popAndPushNamed(context, '/lec5Home');
            },
                child: const Icon(Icons.home,color: Colors.orange,size: 50,)
            )
          ],
        ),
      ),
    );
  }
}
