// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

class CustomNavBar extends StatelessWidget {
  int selectedIndex;
  void Function(int)? onItemTapped;

  CustomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_mark),
          label: 'Quiz',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: utilities.primaryColor,
      backgroundColor: utilities.secondaryColor,
      unselectedItemColor: utilities.primaryColor,
      selectedIconTheme: const IconThemeData(size: 50),
      onTap: onItemTapped,
    );
  }
}

class CustomNavBarRanking extends StatelessWidget {
  int selectedIndex;
  void Function(int)? onItemTapped;

  CustomNavBarRanking({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.place),
          label: 'Local',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Global',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: utilities.primaryColor,
      backgroundColor: utilities.secondaryColor,
      unselectedItemColor: utilities.primaryColor,
      selectedIconTheme: const IconThemeData(size: 50),
      onTap: onItemTapped,
    );
  }
}
