import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../components/custom_navigation_rail.dart';

class RankingScreenTablet extends StatelessWidget {
  final void Function(int)? onItemTapped;
  final int selectedIndex;

  const RankingScreenTablet({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utilities.secondaryColor,
      body: Center(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: CustomText(
                          text: AppLocalizations.of(context)!.localranking,
                          size: 30,
                          bold: true,
                          thirdColor: true,
                        ),
                      ),
                      const Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      Flexible(
                        flex: 16,
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: utilities.tertiaryColor,
                                style: BorderStyle.solid,
                                width: 0.1,
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
                                          text: AppLocalizations.of(context)!
                                              .usernameranking,
                                          thirdColor: true,
                                          size: 20,
                                          bold: true,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: CustomText(
                                          text: AppLocalizations.of(context)!
                                              .bestscoreranking,
                                          thirdColor: true,
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
                                          thirdColor: true,
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
                                          thirdColor: true,
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
                                          thirdColor: true,
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
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: CustomText(
                          text: AppLocalizations.of(context)!.globalranking,
                          size: 30,
                          bold: true,
                          thirdColor: true,
                        ),
                      ),
                      const Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      Flexible(
                        flex: 16,
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: utilities.tertiaryColor,
                                style: BorderStyle.solid,
                                width: 0.1,
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
                                          text: AppLocalizations.of(context)!
                                              .usernameranking,
                                          thirdColor: true,
                                          size: 20,
                                          bold: true,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: CustomText(
                                          text: AppLocalizations.of(context)!
                                              .bestscoreranking,
                                          thirdColor: true,
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
                                          thirdColor: true,
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
                                          thirdColor: true,
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
                                          thirdColor: true,
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
