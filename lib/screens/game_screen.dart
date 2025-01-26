import 'package:flutter/material.dart';

import '../widgets/custom_scaffold.dart';
import '../widgets/field_card.dart';
import '../widgets/stats_card.dart';
import '../widgets/turn_widget.dart';
import '../widgets/win_dialog.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
    required this.single,
    required this.side1,
    required this.side2,
    this.name1 = ' ',
    this.name2 = 'Player 2',
  });

  final bool single;
  final int side1;
  final int side2;
  final String name1;
  final String name2;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<int> ids = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<List<int>> winningCombos = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  int stats1 = 0;
  int stats2 = 0;
  int stats3 = 0;

  bool turn = true;
  bool canTap = true;

  bool getWin() {
    int x = turn ? widget.side1 : widget.side2;
    return winningCombos.any((combo) {
      return ids[combo[0]] == x && ids[combo[1]] == x && ids[combo[2]] == x;
    });
  }

  bool getGreen(int id) {
    int x = turn ? widget.side1 : widget.side2;
    return winningCombos.any((combo) {
      return combo.contains(id) &&
          ids[combo[0]] == x &&
          ids[combo[1]] == x &&
          ids[combo[2]] == x;
    });
  }

  void reset() {
    setState(() {
      turn = true;
      canTap = true;
      ids = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    });
  }

  void onField(int value) {
    if (canTap) {
      setState(() {
        ids[value] = turn ? widget.side1 : widget.side2;
        canTap = false;
      });

      Future.delayed(
        Duration(milliseconds: 400),
        () {
          if (getWin()) {
            turn ? stats1++ : stats2++;
            if (mounted) {
              showDialog(
                context: context,
                builder: (context) {
                  return WinDialog(
                    title: widget.single
                        ? ''
                        : turn
                            ? widget.name1
                            : widget.name2,
                  );
                },
              ).then((value) {
                reset();
              });
            }
          } else {
            if (ids.contains(0)) {
              if (widget.single) {}
              turn = !turn;
              canTap = true;
              setState(() {});
            } else {
              stats3++;
              reset();
            }
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: stats1 == 0 && stats2 == 0 && stats3 == 0,
      child: CustomScaffold(
        exit: stats1 != 0 || stats2 != 0 || stats3 != 0,
        body: Column(
          children: [
            SizedBox(height: 76 + MediaQuery.of(context).viewPadding.top),
            StatsCard(
              side1: widget.side1,
              side2: widget.side2,
              stats1: stats1,
              stats2: stats2,
              stats3: stats3,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FieldCard(
                  index: 0,
                  id: ids[0],
                  green: getGreen(0),
                  onPressed: onField,
                ),
                FieldCard(
                  index: 1,
                  id: ids[1],
                  green: getGreen(1),
                  onPressed: onField,
                ),
                FieldCard(
                  index: 2,
                  id: ids[2],
                  green: getGreen(2),
                  onPressed: onField,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FieldCard(
                  index: 3,
                  id: ids[3],
                  green: getGreen(3),
                  onPressed: onField,
                ),
                FieldCard(
                  index: 4,
                  id: ids[4],
                  green: getGreen(4),
                  onPressed: onField,
                ),
                FieldCard(
                  index: 5,
                  id: ids[5],
                  green: getGreen(5),
                  onPressed: onField,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FieldCard(
                  index: 6,
                  id: ids[6],
                  green: getGreen(6),
                  onPressed: onField,
                ),
                FieldCard(
                  index: 7,
                  id: ids[7],
                  green: getGreen(7),
                  onPressed: onField,
                ),
                FieldCard(
                  index: 8,
                  id: ids[8],
                  green: getGreen(8),
                  onPressed: onField,
                ),
              ],
            ),
            SizedBox(height: 22),
            TurnWidget(
              turn: turn,
              single: widget.single,
              side1: widget.side1,
              side2: widget.side2,
              name1: widget.name1,
              name2: widget.name2,
            ),
          ],
        ),
      ),
    );
  }
}
