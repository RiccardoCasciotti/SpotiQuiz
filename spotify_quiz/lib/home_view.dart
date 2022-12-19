import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:spotify_quiz/models/user.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    createUser(
        uid: "UhuhAhAh",
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

//Trial to do BottomNavBar,but seems like it needs to be managed by setstate,maybe doing as a block would be better
/*
Widget BottomNavBar(@required _selectedIndex) {
  return BottomNavigationBar(
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
  );
}
*/

//This was at line 87
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


