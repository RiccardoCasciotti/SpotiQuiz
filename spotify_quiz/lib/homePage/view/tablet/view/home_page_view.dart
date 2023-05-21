import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/homePage/view/tablet/view/home_screen.dart';
import 'package:spotify_quiz/homePage/view/tablet/view/quiz_screen.dart';
import 'package:spotify_quiz/homePage/view/tablet/view/ranking_screen.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';
import 'package:spotify_quiz/user/bloc/user_bloc.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../../../authentication/bloc/authentication_bloc.dart';

class MyHomePageTablet extends StatefulWidget {
  const MyHomePageTablet({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const MyHomePageTablet());
  }

  @override
  State<MyHomePageTablet> createState() => _MyHomePageTabletState();
}

class _MyHomePageTabletState extends State<MyHomePageTablet> {
  int _selectedIndex = 0;

  Future<void> _onItemTapped(int index) async {
    if (index == 2) {
      final UserRepository userRepository = UserRepository();

      var userByNation = await userRepository
          .getUsersByNation(context.read<AuthenticationBloc>().user.nation);
      userByNation.sort(((a, b) {
        if (a.bestScore > b.bestScore) {
          return -1;
        } else if (a.bestScore < b.bestScore) {
          return 1;
        } else {
          return 0;
        }
      }));
      // ignore: use_build_context_synchronously
      context.read<AuthenticationBloc>().userByNation = userByNation;

      var users = await userRepository.getUsers();
      users.sort(((a, b) {
        if (a.bestScore > b.bestScore) {
          return -1;
        } else if (a.bestScore < b.bestScore) {
          return 1;
        } else {
          return 0;
        }
      }));
      // ignore: use_build_context_synchronously
      context.read<AuthenticationBloc>().userGlobal = users;
    }
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

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/mic.jpg"), context);
    precacheImage(const AssetImage("assets/images/singer.jpg"), context);
    precacheImage(const AssetImage("assets/images/concert.jpg"), context);
    final pages = [
      HomeScreenTablet(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
      QuizScreenTablet(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
      RankingScreenTablet(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
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
                  transitionType: SharedAxisTransitionType.vertical,
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
