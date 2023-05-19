import 'package:flutter/material.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
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
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.question_mark),
          label: AppLocalizations.of(context)!.quizpage,
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: utilities.primaryColor,
      backgroundColor: utilities.similSecondaryColor,
      unselectedItemColor: utilities.tertiaryColor.withOpacity(0.7),
      selectedIconTheme: const IconThemeData(size: 50),
      elevation: 30.0,
      onTap: onItemTapped,
    );
  }
}

// ignore: must_be_immutable
class CustomNavBarRanking extends StatelessWidget {
  int selectedIndex;
  void Function(int)? onItemTapped;

  CustomNavBarRanking({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: const Key("NavBarRanking"));

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.place),
          label: AppLocalizations.of(context)!.localbutton,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.public),
          label: AppLocalizations.of(context)!.globalbutton,
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: utilities.primaryColor,
      backgroundColor: utilities.similSecondaryColor,
      unselectedItemColor: utilities.tertiaryColor.withOpacity(0.7),
      selectedIconTheme: const IconThemeData(size: 50),
      elevation: 30.0,
      onTap: onItemTapped,
    );
  }
}
