import 'package:flutter/material.dart';

import '../widgets/custom_scaffold.dart';
import '../widgets/main_button.dart';
import '../widgets/svg_widget.dart';
import 'choose_side_screen.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key, required this.single});

  final bool single;

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
                'Game Rules'.toUpperCase(),
                style: TextStyle(
                  color: Color(0xffFEFCFD),
                  fontSize: 32,
                  fontFamily: 'w800',
                ),
              ),
              SizedBox(height: 16),
              _Rules(
                id: 1,
                title: 'Win',
                description:
                    'You win a set by forming a line of three symbols (horizontal, vertical, or diagonal).',
              ),
              _Rules(
                id: 2,
                title: 'Defeat',
                description:
                    'You lose a set if your opponent forms a line of three symbols first.',
              ),
              _Rules(
                id: 3,
                title: 'Draw',
                description:
                    'A set ends in a draw if all cells are filled but no line of three symbols is created.',
              ),
            ],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 50,
            child: MainButton(
              title: 'Next',
              type: 1,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChooseSideScreen(single: single);
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

class _Rules extends StatelessWidget {
  const _Rules({
    required this.id,
    required this.title,
    required this.description,
  });

  final int id;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Color(0xff204AA1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(width: 12),
          SvgWidget('assets/status$id.svg'),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xffFEFCFD),
                    fontSize: 16,
                    fontFamily: 'w600',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xff8793A8),
                    fontSize: 14,
                    fontFamily: 'w400',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          SvgWidget('assets/rules$id.svg'),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}
