import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../custom_widgets/bottomNavBar.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //IF USERS ARE CORRECTLY LOADED
    if (_selectedIndex == 0) {
      //IF WE ARE SELECTING HOME, WE RETURN THE HOME SCAFFOLD
      return Scaffold(
        appBar: AppBar(
          backgroundColor: utilities.secondaryColor,
          foregroundColor: utilities.primaryColor,
          elevation: 0.0,
          title: const Text("Go back"),
        ),
        backgroundColor: utilities.secondaryColor,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                height: 40,
                width: double.infinity,
                child: CustomText(
                  text: "Local ranking",
                  size: 30,
                  bold: true,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: utilities.primaryColor,
                      style: BorderStyle.solid,
                      width: 3,
                    ),
                    shape: BoxShape.rectangle),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Table(
                      border: TableBorder.symmetric(),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "Username",
                                size: 20,
                                bold: true,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "Best score",
                                size: 20,
                                bold: true,
                              ),
                            ),
                          ],
                        ),
                        const TableRow(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "Lollo",
                                size: 20,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "3000",
                                size: 20,
                                bold: true,
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "Arci",
                                size: 20,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "2300",
                                size: 20,
                                bold: true,
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "Romolo",
                                size: 20,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "1000",
                                size: 20,
                                bold: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                      defaultColumnWidth: const FlexColumnWidth(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavBarRanking(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      );
    } else {
      //ELSE WE RETURN THE QUIZ PAGE SCAFFOLD
      return Scaffold(
        appBar: AppBar(
          backgroundColor: utilities.secondaryColor,
          foregroundColor: utilities.primaryColor,
          elevation: 0.0,
          title: const Text("Go back"),
        ),
        backgroundColor: utilities.secondaryColor,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                height: 40,
                width: double.infinity,
                child: CustomText(
                  text: "Global ranking",
                  size: 30,
                  bold: true,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: utilities.primaryColor,
                      style: BorderStyle.solid,
                      width: 3,
                    ),
                    shape: BoxShape.rectangle),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Table(
                      border: TableBorder.symmetric(),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "Username",
                                size: 20,
                                bold: true,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "Best score",
                                size: 20,
                                bold: true,
                              ),
                            ),
                          ],
                        ),
                        const TableRow(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "Lollo",
                                size: 20,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "3000",
                                size: 20,
                                bold: true,
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "Arci",
                                size: 20,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "2300",
                                size: 20,
                                bold: true,
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "Romolo",
                                size: 20,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "1000",
                                size: 20,
                                bold: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                      defaultColumnWidth: const FlexColumnWidth(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavBarRanking(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      );
    }
  }
}
