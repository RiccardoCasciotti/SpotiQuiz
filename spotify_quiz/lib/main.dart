import 'package:authentication_repository/authentication_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:spotify_quiz/repositories/firebase_options.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'package:spotify_quiz/homePage/view/tablet/view/home_page_view.dart';
import 'package:spotify_quiz/utility/api_calls.dart';
import 'authentication/authentication.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'loading/view/splash_page.dart';
import 'login/bloc/login_bloc.dart';
import 'login/view/login_page.dart';

import 'package:spotify_quiz/homePage/view/home_page_view.dart';
import 'package:spotify_quiz/loading/splash.dart';
import 'repositories/user/user_repository.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  // ignore: unused_local_variable
  final fbApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  //FirebaseFirestore db = FirebaseFirestore.instance;
  // Add a new document with a generated ID
  //db.collection("users").add(user); 
  Future<Placemark> _getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];

    return place;
  }

  Future<List<dynamic>> _getCurrentPosition() async {
    // final hasPermission = await _handleLocationPermission();
    var permission;
    if(utilities.runningTest){
      permission = LocationPermission.always;
    }
    else{
      permission = await Geolocator.checkPermission();
    }
    
     if (permission != LocationPermission.always && permission != LocationPermission.whileInUse) return [];

   
    
    var events;

    if(utilities.runningTest){
      events = await get_events_on_position("Milano");
    }
    else{
       Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
      Placemark pos = await _getAddressFromLatLng(position);
      events = await get_events_on_position(pos.locality);
    }
    
    return events;
  }
  var permission;
  if(utilities.runningTest) {
    permission = LocationPermission.always;
  }
  else{
   permission = await Geolocator.checkPermission();
  }
  if (permission == LocationPermission.always || permission == LocationPermission.whileInUse){
    print("Prefetching events...");
    utilities.events_prefetch=   _getCurrentPosition();
    utilities.location = true;
   
//     CachedNetworkImage(
//    imageUrl: "http://via.placeholder.com/350x150",
//    placeholder: (context, url) => new CircularProgressIndicator(),
//    errorWidget: (context, url, error) => new Icon(Icons.error),
//  );
  }
  
  
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/mic.jpg"), context);
    precacheImage(const AssetImage("assets/images/singer.jpg"), context);
    precacheImage(const AssetImage("assets/images/concert.jpg"), context);
    precacheImage(const AssetImage("assets/images/sarabanda.jpg"), context);
    precacheImage(const AssetImage("assets/images/album.jpg"), context);
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: _authenticationRepository,
              userRepository: _userRepository,
            ),
          ),
          BlocProvider(create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          }),
        ],
        child: const MediaQuery(data: MediaQueryData(), child: MyAppView()),
      ),
    );
  }
}

class MyAppView extends StatefulWidget {
  const MyAppView({super.key});

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
        Locale('it'), // Italian
        Locale('fr'), // French
        Locale('de'), // German
        Locale('ru'), // Russian
      ],
      navigatorKey: _navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.black,
      ),
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            //print(state.status);
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  MediaQuery.of(context).size.shortestSide < 550
                      ? MyHomePage.route()
                      : MyHomePageTablet.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unknown:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
