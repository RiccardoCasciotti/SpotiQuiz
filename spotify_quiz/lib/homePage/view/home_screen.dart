import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/authentication/bloc/authentication_bloc.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../custom_widgets/bottom_nav_bar.dart';
import '../../custom_widgets/box_avatar_with_hero.dart';
import '../../custom_widgets/custom_buttons.dart';
import '../../profilePage/view/setting_page_view.dart';

class HomeScreen extends StatelessWidget {
  final void Function(dynamic context)? firstButtonPressed;
  final void Function(dynamic context)? secondButtonPressed;
  final void Function(int)? onItemTapped;
  final int selectedIndex;

  const HomeScreen({
    Key? key,
    required this.firstButtonPressed,
    required this.secondButtonPressed,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: const Key("HomePage"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: utilities.secondaryColor,
        actions: <Widget>[
          IconButton(
            key: const Key("LogoutHome"),
            icon: Icon(
              Icons.logout_outlined,
              color: utilities.primaryColor,
            ),
            onPressed: () async {
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationLogoutRequested());
              // ignore: use_build_context_synchronously
            },
          )
        ],
      ),
      backgroundColor: utilities.secondaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CustomBoxAvatarWithHero(
                    key: const Key("ProfilePicHome"),
                    picUrl: utilities.imageUserProfile,
                    tags: "profilePic",
                    newPage: const ProfilePage(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    key: const Key("UsernameHome"),
                    text: context.read<AuthenticationBloc>().user.username,
                    thirdColor: true,
                    size: 25,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Table(
                border: TableBorder.symmetric(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: CustomText(
                          key: const Key("LevelHome"),
                          text: AppLocalizations.of(context)!.level,
                          thirdColor: true,
                          size: 30,
                          bold: true,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: CustomText(
                          key: const Key("LevelHomeInfo"),
                          text: context
                              .read<AuthenticationBloc>()
                              .user
                              .level
                              .toString(),
                          size: 30,
                          bold: true,
                        ),
                      ),
                    ],
                  ),
                  const TableRow(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: CustomText(
                          key: const Key("NOfQuizHome"),
                          text: AppLocalizations.of(context)!.nofquiz,
                          size: 30,
                          thirdColor: true,
                          bold: true,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: CustomText(
                          key: const Key("NOfQuizHomeInfo"),
                          text: context
                              .read<AuthenticationBloc>()
                              .user
                              .numberQuiz
                              .toString(),
                          size: 30,
                          bold: true,
                        ),
                      ),
                    ],
                  ),
                  const TableRow(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(150),
                  1: FixedColumnWidth(150),
                },
              ),
              const SizedBox(
                height: 50,
              ),
              const CustomButtonsHome(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        key: const Key("NavBarHome"),
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
