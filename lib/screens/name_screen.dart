import 'package:flutter/material.dart';

import '../widgets/custom_scaffold.dart';
import '../widgets/main_button.dart';
import '../widgets/name_field.dart';
import 'game_screen.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({
    super.key,
    required this.single,
    required this.side1,
    required this.side2,
  });

  final bool single;
  final int side1;
  final int side2;

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final name1 = TextEditingController();
  final name2 = TextEditingController();

  @override
  void dispose() {
    name1.dispose();
    name2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
              top: 76 + MediaQuery.of(context).viewPadding.top,
              bottom: 16,
            ),
            children: [
              Text(
                'Enter players name'.toUpperCase(),
                style: TextStyle(
                  color: Color(0xffFEFCFD),
                  fontSize: 32,
                  fontFamily: 'w800',
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Let’s add a personal touch! Enter the names of the players to make the game even more exciting.',
                style: TextStyle(
                  color: Color(0xff8793A8),
                  fontSize: 14,
                  fontFamily: 'w400',
                ),
              ),
              SizedBox(height: 35),
              Text(
                'Player 1',
                style: TextStyle(
                  color: Color(0xffFEFCFD),
                  fontSize: 12,
                  fontFamily: 'w600',
                ),
              ),
              SizedBox(height: 8),
              NameField(
                controller: name1,
                hintText: 'Ex. John',
              ),
              SizedBox(height: 16),
              Text(
                'Player 2',
                style: TextStyle(
                  color: Color(0xffFEFCFD),
                  fontSize: 12,
                  fontFamily: 'w600',
                ),
              ),
              SizedBox(height: 8),
              NameField(
                controller: name2,
                hintText: 'Ex. Emma',
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
                        side1: widget.side1,
                        side2: widget.side2,
                        name1: name1.text.isEmpty ? 'Player 1' : name1.text,
                        name2: name2.text.isEmpty ? 'Player 2' : name2.text,
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
