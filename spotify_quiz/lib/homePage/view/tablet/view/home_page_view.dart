import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:spotify_quiz/homePage/view/tablet/view/home_screen.dart';
import 'package:spotify_quiz/homePage/view/tablet/view/quiz_screen.dart';
import 'package:spotify_quiz/homePage/view/tablet/view/ranking_screen.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';
import 'package:spotify_quiz/user/bloc/user_bloc.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../../../authentication/bloc/authentication_bloc.dart';
import '../../../../quizPage/controllers/question_controller.dart';
import '../../../../utility/api_calls.dart';
import 'event_screen.dart';

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

  Future<Placemark> _getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude, localeIdentifier: "en");

    Placemark place = placemarks[0];

    return place;
  }

  Future<List<dynamic>> _getCurrentPosition() async {
    // final hasPermission = await _handleLocationPermission();
    var permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.always &&
        permission != LocationPermission.whileInUse) return [];

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var events;
    if (utilities.runningTest) {
      events = await get_events_on_position("Milano");
    } else {
      Placemark pos = await _getAddressFromLatLng(position);
      events = await get_events_on_position(pos.locality);
    }

    return events;
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

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
    if (index == 3) {
      if (utilities.location == false && utilities.events_prefetch == null) {
        if (!utilities.runningTest) {
          utilities.location = await _handleLocationPermission();
        } else {
          utilities.location = true;
        }
        utilities.events_prefetch = _getCurrentPosition();
      }
      if (utilities.location) {
        setState(() {
          _selectedIndex = index;
        });
      }
    }
    if (index != 3) {
      setState(() {
        _selectedIndex = index;
      });
    }
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

    precacheImage(const AssetImage("assets/images/mic.jpg"), context);
    precacheImage(const AssetImage("assets/images/singer.jpg"), context);
    precacheImage(const AssetImage("assets/images/concert.jpg"), context);
    precacheImage(const AssetImage("assets/images/victorycup1.png"), context);
    final pages = [
      HomeScreenTablet(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
      QuizScreenTablet(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
      RankingScreenTablet(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
      EventScreenTablet(
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
