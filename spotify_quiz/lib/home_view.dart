import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/custom_widgets/boxCustomPic.dart';
import 'package:spotify_quiz/custom_widgets/boxedWidget.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/gameInfoView.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';
import 'package:spotify_quiz/sample.dart';
import 'package:spotify_quiz/settingPageView.dart';
import 'package:spotify_quiz/user/bloc/user_bloc.dart';

import 'package:spotify_quiz/utilities.dart' as utilities;

import 'custom_widgets/bottomNavBar.dart';
import 'custom_widgets/boxAvatarsHero.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  static Route<void> route() {
    return MaterialPageRoute<void>(
        builder: (_) => const MyHomePage(title: "Ciao"));
  }

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> trialArtists = [
    Column(
      textDirection: TextDirection.ltr,
      children: [
        CustomContainerPic(
          picUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          withBorder: false,
          width: 150,
          height: 150,
        ),
        CustomText(
          text: "Peppe",
          size: 20,
          bold: true,
        ),
      ],
    ),
    Column(
      children: [
        CustomContainerPic(
          picUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          withBorder: false,
          width: 150,
          height: 150,
        ),
        CustomText(
          text: "Peppe",
          size: 20,
          bold: true,
        ),
      ],
    ),
    Column(
      children: [
        CustomContainerPic(
          picUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          withBorder: false,
          width: 150,
          height: 150,
        ),
        CustomText(
          text: "Peppe",
          size: 20,
          bold: true,
        ),
      ],
    ),
    Column(
      children: [
        CustomContainerPic(
          picUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          withBorder: false,
          width: 150,
          height: 150,
        ),
        CustomText(
          text: "Peppe",
          size: 20,
          bold: true,
        ),
      ],
    ),
    Column(
      children: [
        CustomContainerPic(
          picUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          withBorder: false,
          width: 150,
          height: 150,
        ),
        CustomText(
          text: "Peppe",
          size: 20,
          bold: true,
        ),
      ],
    ),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _selectedIndex = index;
    });
  }

  void _createUser(context) {
    BlocProvider.of<UserBloc>(context)
        .add(Create("mench", "Ursula", 1, 1, 1, 1));
  }

  void _getUsers(context) {
    BlocProvider.of<UserBloc>(context).add(GetDataByID("mench"));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> trialGames = [
      Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameInfoPage(selectedGame: 1),
              ),
            ),
            child: Hero(
              tag: "game1",
              child: CustomContainerPic(
                picUrl:
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                withBorder: true,
                width: 150,
                height: 150,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            text: "Artists",
            size: 20,
            bold: true,
            italic: true,
          ),
        ],
      ),
      Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameInfoPage(selectedGame: 2),
              ),
            ),
            child: Hero(
              tag: "game2",
              child: CustomContainerPic(
                picUrl:
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                withBorder: true,
                width: 150,
                height: 150,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            text: "Songs",
            size: 20,
            bold: true,
            italic: true,
          ),
        ],
      ),
      Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameInfoPage(
                  selectedGame: 3,
                ),
              ),
            ),
            child: Hero(
              tag: "game3",
              child: CustomContainerPic(
                picUrl:
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                withBorder: true,
                width: 150,
                height: 150,
                circularity: 10,
              ),
            ),
          ),
          CustomText(
            text: "Casual",
            size: 20,
            bold: true,
            italic: true,
          ),
        ],
      ),
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
                state is UserNotFound) {
              //IF USERS ARE CORRECTLY LOADED
              if (_selectedIndex == 0) {
                //IF WE ARE SELECTING HOME, WE RETURN THE HOME SCAFFOLD
                return Scaffold(
                  backgroundColor: utilities.secondaryColor,
                  body: Center(
                    //body: LayoutBuilder TODO, see slides
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CustomBoxAvatarWithHero(
                              picUrl:
                                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                              tags: "profilePic",
                              newPage: const ProfilePage(),
                            ),
                            CustomBoxedWidget(
                              insideBox: CustomText(
                                text: "Username",
                                size: 25,
                              ),
                              sizeRadius: 20.0,
                              widthRadius: 2.0,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  text: "Level",
                                  size: 30,
                                ),
                                CustomText(
                                  text: "1",
                                  size: 35,
                                  bold: true,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  text: "#Quiz",
                                  size: 30,
                                ),
                                CustomText(
                                  text: "0",
                                  size: 35,
                                  bold: true,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  text: "Best Score",
                                  size: 30,
                                ),
                                CustomText(
                                  text: "2000",
                                  size: 35,
                                  bold: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                        CustomButtonsHome(
                          firstButtonPressed: _createUser,
                          secondButtonPressed: _getUsers,
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: CustomNavBar(
                    selectedIndex: _selectedIndex,
                    onItemTapped: _onItemTapped,
                  ),
                );
              } else {
                //ELSE WE RETURN THE QUIZ PAGE SCAFFOLD
                return Scaffold(
                  backgroundColor: utilities.secondaryColor,
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      //UPPER PART WITH THE TYPE OF QUIZ
                      Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Choose a quiz!",
                                    size: 30.0,
                                    bold: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: trialGames,
                            ),
                          ),
                        ],
                      ),
                      //LOWER PART PANEL WITH FAVOURITE ARTISTS
                      Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Your favourite Artists",
                                    size: 30.0,
                                    bold: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: trialArtists,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  bottomNavigationBar: CustomNavBar(
                    selectedIndex: _selectedIndex,
                    onItemTapped: _onItemTapped,
                  ),
                );
              }
            } else if (state is UserLoaded) {
              return Scaffold(
                backgroundColor: utilities.secondaryColor,
                body: Center(
                  //body: LayoutBuilder TODO, see slides
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CustomContainerPic(
                            picUrl:
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                            sizeBorder: 2.0,
                          ),
                          CustomBoxedWidget(
                            insideBox: CustomText(
                              text: state.mydata[0].username,
                              size: 25,
                            ),
                            sizeRadius: 20.0,
                            widthRadius: 2.0,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomText(
                                text: "Level",
                                size: 30,
                              ),
                              CustomText(
                                text: "1",
                                size: 35,
                                bold: true,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomText(
                                text: "#Quiz",
                                size: 30,
                              ),
                              CustomText(
                                text: "0",
                                size: 35,
                                bold: true,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomText(
                                text: "Best Score",
                                size: 30,
                              ),
                              CustomText(
                                text: "2000",
                                size: 35,
                                bold: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomButtonsHome(
                        firstButtonPressed: _createUser,
                        secondButtonPressed: _getUsers,
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: CustomNavBar(
                  selectedIndex: _selectedIndex,
                  onItemTapped: _onItemTapped,
                ),
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

class CustomButtonsHome extends StatelessWidget {
  void Function(dynamic context)? firstButtonPressed;
  void Function(dynamic context)? secondButtonPressed;

  CustomButtonsHome({
    Key? key,
    required this.firstButtonPressed,
    required this.secondButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: utilities.primaryColor,
                  foregroundColor: utilities.secondaryColor,
                  onPressed: () {
                    firstButtonPressed!(context);
                  },
                  child: const Icon(Icons.emoji_events_outlined),
                ),
                CustomText(
                  text: "Ranking",
                  size: 20.0,
                  italic: true,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: utilities.primaryColor,
                  foregroundColor: utilities.secondaryColor,
                  onPressed: () {
                    secondButtonPressed!(context);
                  },
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
                CustomText(
                  text: "Cart",
                  size: 20.0,
                  italic: true,
                ),
              ],
            ),
            const SizedBox(width: 16),
          ],
        ),
      ],
    );
  }
}

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
