import 'package:blackhourses/utilities/lbl_header1.dart';
import 'package:flutter/material.dart';

import '../utilities/appbar.dart';
import '../utilities/btn_elevated.dart';

class FrmLec5PointsCounter extends StatefulWidget {
  const FrmLec5PointsCounter({super.key});

  @override
  State<FrmLec5PointsCounter> createState() => _FrmLec5PointsCounter();
}

class _FrmLec5PointsCounter extends State<FrmLec5PointsCounter> {

  CustomAppBar myAppBar = CustomAppBar(title: "Points Counter");

  int teamAPoints = 0;
  int teamBPoints = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar.appBarTitle(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              retTeam('Team A'),
              const SizedBox(width: 10),
              retTeam('Team B')
            ],
          ),

          const SizedBox(height: 50),

          Center(
            child: BtnElevated(
              text: 'Reset',
              width: 250,
              onPressed: () {
                setState(() {
                  teamAPoints = 0;
                  teamBPoints = 0;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Column retTeam(String teamName) {
    return Column(
      children: [
        H1(
          txt: teamName!,
          txtColor: Colors.black,
        ),
        Text(
          teamName == 'Team A'
              ? teamAPoints.toString()
              : teamBPoints.toString(),
          style: const TextStyle(
              color: Colors.black26, fontSize: 70, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 35),
        BtnElevated(
          text: 'Add 1 Point',
          width: 150,
          onPressed: () {
            setState(() {
              switch (teamName) {
                case 'Team A':
                  teamAPoints++;
                  break;
                default:
                  teamBPoints++;
                  break;
              }
            });
          },
        ),
        const SizedBox(height: 15),
        BtnElevated(
          text: 'Add 2 Point',
          width: 150,
          onPressed: () {
            setState(() {
              switch (teamName) {
                case 'Team A':
                  teamAPoints += 2;
                  break;
                default:
                  teamBPoints += 2;
                  break;
              }
            });
          },
        ),
        const SizedBox(height: 15),
        BtnElevated(
          text: 'Add 3 Point',
          width: 150,
          onPressed: () {
            setState(() {
              switch (teamName) {
                case 'Team A':
                  teamAPoints += 3;
                  break;
                default:
                  teamBPoints += 3;
                  break;
              }
            });
          },
        ),
      ],
    );
  }
}
