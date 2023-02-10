import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify_quiz/authentication/authentication.dart';
import 'package:spotify_quiz/home_view.dart';
import 'package:spotify_quiz/loading/splash.dart';
import 'package:spotify_quiz/themes/bloc/theme_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'firebase_options.dart';

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
  //int _counter = 0;

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
                      _navigator.push(
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<ThemeBloc>(context),
                            child: const MyHomePage(
                              title: "ok",
                            ),
                          ),
                        ),
                      );
                      break;
                    case AuthenticationStatus.unauthenticated:
                      _navigator.push(
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<ThemeBloc>(context),
                            child: const MyHomePage(
                              title: "ok",
                            ),
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
