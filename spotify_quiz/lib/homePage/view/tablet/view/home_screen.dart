import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/boxed_widgets.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../components/custom_navigation_rail.dart';

class HomeScreenTablet extends StatelessWidget {
  final void Function(int)? onItemTapped;
  final int selectedIndex;

  const HomeScreenTablet({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utilities.secondaryColor,
      body: Center(
        //body: LayoutBuilder TODO, see slides
        child: Row(
          children: [
            CustomNavRail(
              selectedIndex: selectedIndex,
              onItemTapped: onItemTapped,
            ),
            const VerticalDivider(
              thickness: 1,
              width: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        const CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Username",
                          thirdColor: true,
                          size: 25,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
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
                                text: "Level",
                                thirdColor: true,
                                size: 30,
                                bold: true,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "1",
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
                                text: "#Quiz",
                                size: 30,
                                thirdColor: true,
                                bold: true,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "2300",
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
                                text: "Coins",
                                thirdColor: true,
                                size: 30,
                                bold: true,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "1000",
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
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              text: "Statistics",
                              thirdColor: true,
                              size: 25,
                              bold: true,
                            ),
                            CustomBoxedWidget(
                              thirdColor: true,
                              widthRadius: 0.1,
                              insideBox: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "Correct Answers",
                                        thirdColor: true,
                                        size: 20,
                                      ),
                                      CustomText(
                                        text: "100%",
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "Wrong Answers",
                                        thirdColor: true,
                                        size: 20,
                                      ),
                                      CustomText(
                                        text: "89%",
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "Total Points",
                                        thirdColor: true,
                                        size: 20,
                                      ),
                                      CustomText(
                                        text: "70%",
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              text: "Most known artists",
                              thirdColor: true,
                              size: 25,
                              bold: true,
                            ),
                            CustomBoxedWidget(
                              widthRadius: 0.1,
                              thirdColor: true,
                              insideBox: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "Jessica Jones",
                                        thirdColor: true,
                                        size: 20,
                                      ),
                                      CustomText(
                                        text: "100%",
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "Ed Points",
                                        thirdColor: true,
                                        size: 20,
                                      ),
                                      CustomText(
                                        text: "89%",
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "Enrique Ilo",
                                        thirdColor: true,
                                        size: 20,
                                      ),
                                      CustomText(
                                        text: "70%",
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
