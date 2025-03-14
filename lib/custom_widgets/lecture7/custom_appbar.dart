
import 'package:flutter/material.dart';

class CustomAppBar{

  static AppBar customAppbar(BuildContext ctx, bool viewHome){
    return AppBar(
      backgroundColor: Colors.transparent,

      leading: viewHome ? InkWell(
        onTap: (){
          Navigator.pushNamedAndRemoveUntil(ctx, '/Lec7HomeNews', ModalRoute.withName('/'));
        } ,
          child: const Icon(Icons.home,color: Colors.orange,)) : null,

      title: Center(
        child: RichText(
         text: const TextSpan(
           style: TextStyle(
             color: Colors.black,
             fontSize: 25,
             fontWeight: FontWeight.w700),
             children: <TextSpan> [
               TextSpan(
                 text: 'News'
               ),
               TextSpan(
                 text: 'Cloud',
                 style: TextStyle(
                     color: Colors.orangeAccent,
                     fontSize: 25,
                     fontWeight: FontWeight.w700
                 )
               )

             ]
           )
         ),
      ),
    );
  }
}