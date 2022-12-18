import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:spotify_quiz/models/user.dart' as usermodel;

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  //FirebaseFirestore db = FirebaseFirestore.instance;
  // Add a new document with a generated ID
  //db.collection("users").add(user);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("You have an error!${snapshot.error.toString()}");
              return Text("Something went wrong");
            } else if (snapshot.hasData) {
              DatabaseReference ref = FirebaseDatabase.instance.ref();
              if (ref != null) {
                return MyHomePage(title: 'Flutter Demo Home Page');
              } else {
                return Text("Something went wrong getting databse instance");
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/*class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    createUser(
        uid: "SpotifyQuiz",
        coins: 0,
        experience: 0,
        numOfQuiz: 0,
        username: "Ollo");
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Future createUser(
      {required String uid,
      required int coins,
      required double experience,
      required int numOfQuiz,
      required String username}) async {
    //reference to document
    final docUser = FirebaseFirestore.instance.collection('users').doc(uid);

    final json = {
      'coins': coins,
      'experience': experience,
      'numOfQuiz': numOfQuiz,
      'uid': uid,
      'username': username,
    };

    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/

class _MyHomePageState extends State<MyHomePage> {
  Future createUser(
      {required String uid,
      required int coins,
      required int level,
      required double experience,
      required int numOfQuiz,
      required String username}) async {
    //reference to document
    final docUser = FirebaseFirestore.instance.collection('users').doc(uid);

    final json = {
      'coins': coins,
      'experience': experience,
      'level': level,
      'numOfQuiz': numOfQuiz,
      'uid': uid,
      'username': username,
    };

    await docUser.set(json);
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    createUser(
        uid: "UhuhAh",
        coins: 0,
        level: 0,
        experience: 0,
        numOfQuiz: 0,
        username: "Ollo");
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 2, 2),
      body: Center(
        //body: LayoutBuilder TODO, see slides
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 2, 164, 26),
                      width: 2.0,
                    ),
                  ),
                  child: DecoratedBox(
                    // add this
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(20),
                          width: 130.0,
                          height: 130.0,
                        ),
                      ],
                    ),
                  ),
                ),

                /* DecoratedBox(
                  // add this
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: const Color.fromARGB(255, 2, 164, 26),
                    ),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(15),
                        width: 100.0,
                        height: 100.0,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),
                */

                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 2, 164, 26),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: 'Username ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 2, 164, 26),
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: const [
                Text.rich(
                  TextSpan(
                    text: 'Level ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 164, 26),
                      fontSize: 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '1',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 2, 164, 26),
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: '#Quiz ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 164, 26),
                      fontSize: 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '1',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 2, 164, 26),
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Best Score ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 164, 26),
                      fontSize: 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '2000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 2, 164, 26),
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 16),
                    FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 2, 164, 26),
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      onPressed: () {
                        // Add your onPressed code here!
                        VoidCallback;
                      },
                      child: const Icon(Icons.emoji_events_outlined),
                    ),
                    FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 2, 164, 26),
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      onPressed: () {
                        // Add your onPressed code here! In future call shopping page
                        VoidCallback;
                      },
                      child: const Icon(Icons.shopping_cart_outlined),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'Quiz',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 2, 164, 26),
        backgroundColor: const Color.fromARGB(255, 2, 2, 2),
        unselectedItemColor: const Color.fromARGB(255, 2, 164, 26),
        selectedIconTheme: const IconThemeData(size: 50),
        onTap: _onItemTapped,
      ),
    );
  }
}
