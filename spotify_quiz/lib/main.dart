import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:spotify_quiz/button/bloc/button_bloc.dart';
import 'package:spotify_quiz/login/bloc/login_bloc.dart';
import 'authentication/web_view/web_view_login.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:spotify_quiz/authentication/authentication.dart';

import 'package:user_repository/user_repository.dart';
import 'package:spotify_quiz/home/home.dart';
import 'login/bloc/login_bloc.dart';
import 'login/view/login_page.dart';
import 'package:spotify_quiz/loading/splash.dart';
import 'button/view/button_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  

  WidgetsFlutterBinding.ensureInitialized();
  //FirebaseFirestore db = FirebaseFirestore.instance;
  // Add a new document with a generated ID
  //db.collection("users").add(user);
   runApp(MyApp(authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, 
        required this.authenticationRepository,
        required this.userRepository,});
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  final Future<FirebaseApp> _fbApp = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
          create: (_) => AuthenticationBloc(
                authenticationRepository: authenticationRepository,
                userRepository: userRepository,
              ),
          child: MyAppView())
          ,
          
    );
  }
}

class MyAppView extends StatefulWidget {
  const MyAppView({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child){
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state){
            switch (state.status){
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
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
                  break;
            }
          },
          child: child,
        );

      }, 
      onGenerateRoute:  (_) => SplashPage.route(),
    );
  }
}
