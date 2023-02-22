import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:spotify_quiz/rankingPage/global_rank_view.dart';
import 'package:spotify_quiz/rankingPage/local_rank_view.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      LocalRankScreen(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
      GlobalRankScreen(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      )
    ];

    return PageTransitionSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation, secondaryAnimation) =>
            SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              fillColor: utilities.secondaryColor,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            ),
        child: pages[_selectedIndex]);
  }
}
