import 'package:blackhourses/models/family.dart';
import 'package:flutter/material.dart';
import '../models/numbers.dart';
import '../utilities/appbar.dart';
import '../utilities/lbl_h2.dart';

class FrmLec5VacaFamily extends StatelessWidget {
  FrmLec5VacaFamily({super.key});

  CustomAppBar myAppBar = CustomAppBar(title: "Family Members");
  List<FamilyMember> listOfMembers = [
    FamilyMember(memberEn: 'Family', memberJap: 'kazoku', memberPic : 'assets/images/family/family-family.jpg'),
    FamilyMember(memberEn: 'Aunt', memberJap: 'Oba', memberPic : 'assets/images/family/family-aunt.jpg'),
    FamilyMember(memberEn: 'Baby', memberJap: 'Akachan', memberPic : 'assets/images/family/family-baby.jpg'),
    FamilyMember(memberEn: 'Brother', memberJap: 'Kyōdai', memberPic : 'assets/images/family/family-brother.jpg'),
    FamilyMember(memberEn: 'Brother-in-law', memberJap: 'Giri no ani', memberPic : 'assets/images/family/family-brotherinlaw.jpg'),
    FamilyMember(memberEn: 'Cousin', memberJap: 'Itoko', memberPic : 'assets/images/family/family-cousin.jpg'),
    FamilyMember(memberEn: 'Father', memberJap: 'otousan', memberPic : 'assets/images/family/family-father.jpg'),
    FamilyMember(memberEn: 'Father-in-law', memberJap: 'Gifu', memberPic : 'assets/images/family/family-fatherinlaw.jpg'),
    FamilyMember(memberEn: 'Grandfather', memberJap: 'ojiisan', memberPic : 'assets/images/family/family-grandba.jpg'),
    FamilyMember(memberEn: 'Grandmother', memberJap: 'obaasan', memberPic : 'assets/images/family/family-grandma.jpg'),
    FamilyMember(memberEn: 'Great Grandfather', memberJap: 'Sōsofu', memberPic : 'assets/images/family/family-greatGrandba.jpg'),
    FamilyMember(memberEn: 'Great Grandmother', memberJap: 'Sōsobo', memberPic : 'assets/images/family/family-greatGrandma.jpg'),
    FamilyMember(memberEn: 'Husband', memberJap: 'Otto', memberPic : 'assets/images/family/family-husband.jpg'),
    FamilyMember(memberEn: 'Wife', memberJap: 'tsuma', memberPic : 'assets/images/family/family-wife.jpg'),
    FamilyMember(memberEn: 'Mother', memberJap: 'okaasan', memberPic : 'assets/images/family/family-mother.jpg'),
    FamilyMember(memberEn: 'Mother-in-law', memberJap: 'Giri no haha', memberPic : 'assets/images/family/family-motherinlaw.jpg'),
    FamilyMember(memberEn: 'Nephew', memberJap: 'Oi', memberPic : 'assets/images/family/family-nephew.jpg'),
    FamilyMember(memberEn: 'Niece', memberJap: 'Mei', memberPic : 'assets/images/family/family-niece.jpg'),

    FamilyMember(memberEn: 'Sister', memberJap: 'Imōto', memberPic : 'assets/images/family/family-sister.jpg'),
    FamilyMember(memberEn: 'Sister-in-law', memberJap: 'Giri no shimai', memberPic : 'assets/images/family/family-sisterinlaw.jpg'),
    FamilyMember(memberEn: 'Stepfather', memberJap: 'Mamachichi ', memberPic : 'assets/images/family/family-stepdad.jpg'),
    FamilyMember(memberEn: 'Stepmother', memberJap: 'Mamahaha ', memberPic : 'assets/images/family/family-stepmom.jpg'),
    FamilyMember(memberEn: 'Stepdaughter', memberJap: 'Mamako', memberPic : 'assets/images/family/family-stepdaughter.jpg'),
    FamilyMember(memberEn: 'Stepson', memberJap: 'Mamako', memberPic : 'assets/images/family/family-stepson.jpg'),
    FamilyMember(memberEn: 'Uncle', memberJap: 'Oji', memberPic : 'assets/images/family/family-uncle.jpg'),
  ];
  int i = 0;

  @override
  Widget build(BuildContext context) {

    i = listOfMembers.length;

    return Scaffold(
      appBar: myAppBar.appBarTitle(),
      body: ListView.builder(
          itemCount: i,
          itemBuilder: (context, index) {
            return rowShape(en: listOfMembers[index].memberEn,jap: listOfMembers[index].memberJap,pic: listOfMembers[index].memberPic);
          }),
    );
  }

  // Design One Row
  Container rowShape({String? en, String? jap, String? pic}){

    return Container(
      width: double.infinity,
      height: 125,
      color: Colors.brown,

      child: Row(
        children: [

          Image.asset(
            pic!,
            height: 125,
            width: 125,
            fit: BoxFit.fill,
          ),

          const SizedBox(width: 5),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              H2(txt: jap!, txtColor: Colors.orangeAccent),
              H2(txt: en!, txtColor: Colors.white),
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
