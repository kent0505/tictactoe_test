import 'package:flutter/material.dart';

import 'svg_widget.dart';

class TurnWidget extends StatelessWidget {
  const TurnWidget({
    super.key,
    required this.turn,
    required this.single,
    required this.side1,
    required this.side2,
    required this.name1,
    required this.name2,
  });

  final bool turn;
  final bool single;
  final int side1;
  final int side2;
  final String name1;
  final String name2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Player(
          side: side1,
          turn: turn,
          title: single ? 'Your turn' : name1,
        ),
        Container(
          height: 138,
          width: 80,
          margin: EdgeInsets.only(bottom: 30),
          child: Center(
            child: AnimatedRotation(
              duration: Duration(milliseconds: 400),
              turns: turn ? 0 : 0.5,
              child: SvgWidget('assets/turn.svg'),
            ),
          ),
        ),
        _Player(
          side: side2,
          turn: !turn,
          title: single ? 'Computer turn' : name2,
        ),
      ],
    );
  }
}

class _Player extends StatelessWidget {
  const _Player({
    required this.side,
    required this.turn,
    required this.title,
  });

  final int side;
  final bool turn;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          height: 138,
          width: 138,
          decoration: BoxDecoration(
            color: Color(0xff204AA1),
            borderRadius: BorderRadius.circular(16),
            border: turn
                ? Border.all(
                    width: 3,
                    color: Colors.white,
                  )
                : null,
          ),
          child: Center(
            child: SvgWidget('assets/side$side.svg'),
          ),
        ),
        SizedBox(
          height: 30,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 400),
            opacity: turn ? 1 : 0,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xffFEFCFD),
                  fontSize: 12,
                  fontFamily: 'w600',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
