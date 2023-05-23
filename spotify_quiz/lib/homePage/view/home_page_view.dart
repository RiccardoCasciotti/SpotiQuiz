import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:spotify_quiz/eventsPage/view/events_page_view.dart';
import 'package:spotify_quiz/homePage/view/home_screen.dart';
import 'package:spotify_quiz/homePage/view/quiz_screen.dart';
import 'package:spotify_quiz/rankingPage/ranking_page_view.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';
import 'package:spotify_quiz/user/bloc/user_bloc.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../utility/api_calls.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const MyHomePage());
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

/*
 TO DEBUG FIREBASE FUNCTIONALITIES

  void _createUser(context) {
    BlocProvider.of<UserBloc>(context)
        .add(Create("mench", "Ursula", 1, 1, 1, 1));
  }

  void _getUsers(context) {
    BlocProvider.of<UserBloc>(context).add(GetDataByID("mench"));
  }
*/

  void _goToRankingPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RankingPage(),
      ),
    );
  }

  

  void _goToEventPage(context) async{

    
      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  EventsPage(events: []),
      ),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/mic.jpg"), context);
    precacheImage(const AssetImage("assets/images/singer.jpg"), context);
    precacheImage(const AssetImage("assets/images/concert.jpg"), context);
    precacheImage(const AssetImage("assets/images/sarabanda.jpg"), context);
    precacheImage(const AssetImage("assets/images/album.jpg"), context);
    //var tmp = get_artist("0TnOYISbd1XYRBk9myaseg");// ############################################### !!
    final pages = [
      HomeScreen(
          firstButtonPressed: _goToRankingPage,
          secondButtonPressed: _goToEventPage,
          onItemTapped: _onItemTapped,
          selectedIndex: _selectedIndex),
      QuizScreen(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      )
    ];

    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) => UserBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context),
        ),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is InitialState ||
                state is UserAdded ||
                state is UserNotFound ||
                state is UserLoaded) {
              //IF USERS ARE CORRECTLY LOADED
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
                child: pages[_selectedIndex],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
