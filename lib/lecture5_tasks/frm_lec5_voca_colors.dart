import 'package:flutter/material.dart';
import '../models/color.dart';
import '../utilities/appbar.dart';
import '../utilities/lbl_h2.dart';

class FrmLec5VacaColor extends StatelessWidget {
  FrmLec5VacaColor({super.key});

  CustomAppBar myAppBar = CustomAppBar(title: "Colors");
  List<ColorName> listOfColors = [
    ColorName(nameEn: 'Red', nameJap: 'Aka', namePic : 'assets/images/colors/colors-red.jpg'),
    ColorName(nameEn: 'Orange', nameJap: 'Orenji', namePic : 'assets/images/colors/colors-orange.JPG'),
    ColorName(nameEn: 'Yellow', nameJap: 'Kiiro', namePic : 'assets/images/colors/colors-yellow.JPG'),
    ColorName(nameEn: 'Green', nameJap: 'Midori', namePic : 'assets/images/colors/colors-green.jpg'),
    ColorName(nameEn: 'Light Blue', nameJap: 'Mizuiro', namePic : 'assets/images/colors/colors-cyan.JPG'),
    ColorName(nameEn: 'Blue', nameJap: 'Ao', namePic : 'assets/images/colors/colors-blue.jpg'),
    ColorName(nameEn: 'Purple', nameJap: 'Murasaki', namePic : 'assets/images/colors/colors-purple.jpg'),
    ColorName(nameEn: 'Pink', nameJap: 'Pinku', namePic : 'assets/images/colors/colors-pink.jpg'),
    ColorName(nameEn: 'Black', nameJap: 'Kuro', namePic : 'assets/images/colors/colors-black.JPG'),
    ColorName(nameEn: 'White', nameJap: 'Shiro', namePic : 'assets/images/colors/colors-white.JPG'),
    ColorName(nameEn: 'Gray', nameJap: 'Haiiro', namePic : 'assets/images/colors/colors-grey.jpg'),
    ColorName(nameEn: 'Brown', nameJap: 'Chairo', namePic : 'assets/images/colors/colors-brown.JPG'),
    ColorName(nameEn: 'Gold', nameJap: 'Kiniro', namePic : 'assets/images/colors/colors-gold.JPG'),
    ColorName(nameEn: 'Silver', nameJap: 'Giniro', namePic : 'assets/images/colors/colors-silver.JPG'),
  ];
  int i = 0;

  @override
  Widget build(BuildContext context) {

    i = listOfColors.length;

    return Scaffold(
      appBar: myAppBar.appBarTitle(),
      body: ListView.builder(
          itemCount: i,
          itemBuilder: (context, index) {
            return rowShape(en: listOfColors[index].nameEn,jap: listOfColors[index].nameJap,pic: listOfColors[index].namePic);
          }),
    );
  }

  // Design One Row
  Container rowShape({String? en, String? jap, String? pic}){

    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.black12,

      child: Row(
        children: [

          Image.asset(
            pic!,
            height: 100,
            width: 125,
            fit: BoxFit.contain,
          ),

          const SizedBox(width: 5),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              H2(txt: jap!, txtColor: Colors.white),
              H2(txt: en!, txtColor: Colors.black),
            ],
          ),

          const Spacer(),

          GestureDetector(child: const Icon(Icons.play_arrow), onTap: () {
            print(en!);
          }),

          const SizedBox(width: 10,)
        ],
      ),
    );
  }

}
