import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:spotify_quiz/eventsPage/view/events_page_view.dart';
import 'package:spotify_quiz/homePage/view/home_screen.dart';
import 'package:spotify_quiz/homePage/view/quiz_screen.dart';
import 'package:spotify_quiz/rankingPage/ranking_page_view.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';
import 'package:spotify_quiz/user/bloc/user_bloc.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../custom_widgets/box_custom_pic.dart';
import '../../custom_widgets/text.dart';
import '../../models/artist.dart';
import '../../quizPage/controllers/question_controller.dart';
import '../../utility/api_calls.dart';

bool artists_fetch = false;

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

  void _onItemTapped(int index) async {
    print(index);

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void _goToRankingPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RankingPage(),
      ),
    );
  }

  void _goToEventPage(context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EventsPage(),
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    if (!utilities.prefetched) {
      utilities.questions_a_prefetch = createQuestions("A");
      utilities.questions_b_prefetch = createQuestions("B");
      utilities.questions_c_prefetch = createQuestions("C");
      utilities.questions_d_prefetch = createQuestions("D");
      utilities.questions_r_prefetch = createQuestions("R");
      utilities.prefetched = true;
      utilities.artists = get_artist_quizpage();
      precacheImage(const AssetImage("assets/images/event.jpg"), context);
    }

    // precacheImage(const AssetImage("assets/images/mic.jpg"), context);
    // precacheImage(const AssetImage("assets/images/singer.jpg"), context);
    // precacheImage(const AssetImage("assets/images/concert.jpg"), context);
    // precacheImage(const AssetImage("assets/images/sarabanda.jpg"), context);
    // precacheImage(const AssetImage("assets/images/album.jpg"), context);
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
