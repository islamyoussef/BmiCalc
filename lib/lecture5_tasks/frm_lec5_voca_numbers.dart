import 'package:flutter/material.dart';
import '../models/numbers.dart';
import '../utilities/appbar.dart';
import '../utilities/lbl_h2.dart';

class FrmLec5VacaNumbers extends StatelessWidget {
  FrmLec5VacaNumbers({super.key});

  CustomAppBar myAppBar = CustomAppBar(title: "Numbers");
  List<Number> listOfNumbers = [
    Number(numberEn: 'Zero', numberJap: 'Rei', numberPic: 'assets/images/numbers/numbers-0.jpg'),
    Number(numberEn: 'One', numberJap: 'Ichi', numberPic: 'assets/images/numbers/numbers-1.JPG'),
    Number(numberEn: 'Two', numberJap: 'Ni', numberPic: 'assets/images/numbers/numbers-2.jpg'),
    Number(numberEn: 'Three', numberJap: 'San', numberPic: 'assets/images/numbers/numbers-3.jpg'),
    Number(numberEn: 'Four', numberJap: 'Shi/Yon', numberPic: 'assets/images/numbers/numbers-4.jpg'),
    Number(numberEn: 'Five', numberJap: 'Go', numberPic: 'assets/images/numbers/numbers-5.jpg'),
    Number(numberEn: 'Six', numberJap: 'Roku', numberPic: 'assets/images/numbers/numbers-6.jpg'),
    Number(numberEn: 'Seven', numberJap: 'Shichi/Nana', numberPic: 'assets/images/numbers/numbers-7.jpg'),
    Number(numberEn: 'Eight', numberJap: 'Hachi', numberPic: 'assets/images/numbers/numbers-8.jpg'),
    Number(numberEn: 'Nine', numberJap: 'Kyuu/Ku', numberPic: 'assets/images/numbers/numbers-9.jpg'),
    Number(numberEn: 'Ten', numberJap: 'Juu', numberPic: 'assets/images/numbers/numbers-10.jpg')
  ];
  int i = 0;

  @override
  Widget build(BuildContext context) {

    i = listOfNumbers.length;

    return Scaffold(
      appBar: myAppBar.appBarTitle(),
      body: ListView.builder(
          itemCount: i,
          itemBuilder: (context, index) {
            return numberShape(en: listOfNumbers[index].numberEn,jap: listOfNumbers[index].numberJap,pic: listOfNumbers[index].numberPic);
          }),
    );
  }

  // Design One Row
  Container numberShape({String? en, String? jap, String? pic}){

    return Container(
      width: double.infinity,
      height: 85,
      color: Colors.white54,

      child: Row(
        children: [

          Image.asset(
            pic!,
            height: 85,
            width: 125,
            fit: BoxFit.contain,
          ),

          const SizedBox(width: 5),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              H2(txt: jap!, txtColor: Colors.orangeAccent),
              H2(txt: en!, txtColor: Colors.brown),
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
