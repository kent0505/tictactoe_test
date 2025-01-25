import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/main_button.dart';
import '../widgets/svg_widget.dart';
import 'game_screen.dart';

class ChooseSideScreen extends StatefulWidget {
  const ChooseSideScreen({super.key, required this.single});

  final bool single;

  @override
  State<ChooseSideScreen> createState() => _ChooseSideScreenState();
}

class _ChooseSideScreenState extends State<ChooseSideScreen> {
  int side1 = 1;
  int side2 = 2;

  void onSide1(int value) {
    setState(() {
      side1 = value;
    });
  }

  void onSide2(int value) {
    setState(() {
      side2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
              top: 76 + MediaQuery.of(context).viewPadding.top,
              bottom: 140,
            ),
            children: [
              Text(
                'Choose side'.toUpperCase(),
                style: TextStyle(
                  color: Color(0xffFEFCFD),
                  fontSize: 32,
                  fontFamily: 'w800',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Your icon:',
                style: TextStyle(
                  color: Color(0xff8793A8),
                  fontSize: 16,
                  fontFamily: 'w600',
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Side(
                    id: 1,
                    current: side1,
                    onPressed: onSide1,
                  ),
                  SizedBox(width: 20),
                  _Side(
                    id: 3,
                    current: side1,
                    onPressed: onSide1,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Opponent icon:',
                style: TextStyle(
                  color: Color(0xff8793A8),
                  fontSize: 16,
                  fontFamily: 'w600',
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Side(
                    id: 2,
                    current: side2,
                    onPressed: onSide2,
                  ),
                  SizedBox(width: 20),
                  _Side(
                    id: 4,
                    current: side2,
                    onPressed: onSide2,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 50,
            child: MainButton(
              title: 'Start Game',
              type: 1,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GameScreen(
                        single: widget.single,
                        side1: side1,
                        side2: side2,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Side extends StatelessWidget {
  const _Side({
    required this.id,
    required this.current,
    required this.onPressed,
  });

  final int id;
  final int current;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: id == current
          ? null
          : () {
              onPressed(id);
            },
      child: Container(
        height: 138,
        width: 138,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: id == current
              ? Border.all(
                  width: 3,
                  color: Colors.white,
                )
              : null,
        ),
        child: Center(
          child: SvgWidget('assets/side$id.svg'),
        ),
      ),
    );
  }
}
