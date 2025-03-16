import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedTap = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedTap = index;
     // print(selectedTap);
    });
  }

  // final ValueChanged onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/Lec7HomeNews');
              },
              child: const Icon(Icons.home)),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.fact_check_outlined),
          label: 'All',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/Lec7NewsSearch');
              },
              child: const Icon(Icons.search)),
          label: 'Search',
        ),
      ],
      currentIndex: selectedTap,
      selectedItemColor: Colors.white,
      backgroundColor: Colors.orange,
      onTap: _onItemTapped,
    );
  }
}
