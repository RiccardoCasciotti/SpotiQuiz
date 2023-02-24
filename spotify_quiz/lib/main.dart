import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify_quiz/authentication/authentication.dart';
import 'package:spotify_quiz/homePage/view/home_page_view.dart';
import 'package:spotify_quiz/homePage/view/tablet/view/home_page_view.dart';
import 'package:spotify_quiz/loading/splash.dart';
import 'package:spotify_quiz/themes/bloc/theme_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'repositories/firebase_options.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  //FirebaseFirestore db = FirebaseFirestore.instance;
  // Add a new document with a generated ID
  //db.collection("users").add(user);
  runApp(MyApp(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository()));
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.authenticationRepository,
    required this.userRepository,
  });
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
          child: const MyAppView()),
    );
    //     return MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       // This is the theme of your application.
    //       //
    //       // Try running your application with "flutter run". You'll see the
    //       // application has a blue toolbar. Then, without quitting the app, try
    //       // changing the primarySwatch below to Colors.green and then invoke
    //       // "hot reload" (press "r" in the console where you ran "flutter run",
    //       // or simply save your changes to "hot reload" in a Flutter IDE).
    //       // Notice that the counter didn't reset back to zero; the application
    //       // is not restarted.
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: FutureBuilder(
    //       future: _fbApp,
    //       builder: (context, snapshot) {
    //         if (snapshot.hasError) {
    //           print("You have an error!${snapshot.error.toString()}");
    //           return Text("Something went wrong");
    //         } else if (snapshot.hasData) {
    //           DatabaseReference ref = FirebaseDatabase.instance.ref();
    //           if (ref != null) {
    //             return MyAppView();
    //           } else {
    //             return Text("Something went wrong getting databse instance");
    //           }
    //         } else {
    //           return Center(child: CircularProgressIndicator());
    //         }
    //       },
    //     ));
  }
}

class MyAppView extends StatefulWidget {
  const MyAppView({super.key});
  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  bool phoneLayout = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
          .size
          .shortestSide <
      600;
  //int _counter = 0;

  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: _navigatorKey,
            builder: (context, child) {
              return BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  switch (state.status) {
                    case AuthenticationStatus.authenticated:
                      phoneLayout
                          ? _navigator.push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<ThemeBloc>(context),
                                  child: const MyHomePage(),
                                ),
                              ),
                            )
                          : _navigator.push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<ThemeBloc>(context),
                                  child: const MyHomePageTablet(),
                                ),
                              ),
                            );
                      break;
                    case AuthenticationStatus.unauthenticated:
                      phoneLayout
                          ? _navigator.push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<ThemeBloc>(context),
                                  child: const MyHomePage(),
                                ),
                              ),
                            )
                          : _navigator.push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<ThemeBloc>(context),
                                  child: const MyHomePageTablet(),
                                ),
                              ),
                            );
                      break;
                    case AuthenticationStatus.unknown:
                      break;
                  }
                },
                child: child,
              );
            },
            onGenerateRoute: (__) => SplashPage.route(),
          );
        },
      ),
    );
  }
}
