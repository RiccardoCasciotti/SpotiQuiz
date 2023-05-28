import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

// ignore: must_be_immutable
class CustomNavRail extends StatelessWidget {
  int selectedIndex;

  void Function(int)? onItemTapped;

  CustomNavRail({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: const Key("NavigationRail"));

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      groupAlignment: -0.95,
      onDestinationSelected: onItemTapped,
      selectedIconTheme: IconThemeData(
        size: 50,
        color: utilities.primaryColor,
      ),
      unselectedIconTheme:
          IconThemeData(size: 30, color: utilities.tertiaryColor, opacity: 0.7),
      labelType: NavigationRailLabelType.all,
      backgroundColor: utilities.similSecondaryColor,
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
          icon: const Icon(Icons.home_outlined),
          selectedIcon: const Icon(Icons.home),
          label: CustomText(
            text: AppLocalizations.of(context)!.home,
            size: selectedIndex != 0 ? 13 : 20,
            thirdColor: selectedIndex != 0,
          ),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.question_mark_outlined),
          selectedIcon: const Icon(Icons.question_mark),
          label: CustomText(
            text: AppLocalizations.of(context)!.quizpage,
            size: selectedIndex != 1 ? 13 : 20,
            thirdColor: selectedIndex != 1,
          ),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.emoji_events_outlined),
          selectedIcon: const Icon(Icons.emoji_events),
          label: CustomText(
            text: AppLocalizations.of(context)!.ranking,
            size: selectedIndex != 2 ? 13 : 20,
            thirdColor: selectedIndex != 2,
          ),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.star_outline_sharp),
          selectedIcon: const Icon(Icons.star_sharp),
          label: CustomText(
            text: AppLocalizations.of(context)!.events,
            size: selectedIndex != 3 ? 13 : 20,
            thirdColor: selectedIndex != 3,
          ),
        ),
      ],
    );
  }
}
