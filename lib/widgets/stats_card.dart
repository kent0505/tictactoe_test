import 'package:flutter/material.dart';

import 'svg_widget.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
    required this.side1,
    required this.side2,
    required this.stats1,
    required this.stats2,
    required this.stats3,
  });

  final int side1;
  final int side2;
  final int stats1;
  final int stats2;
  final int stats3;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xff204AA1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Stats(
            side: side1,
            value: stats1,
          ),
          _Stats(
            side: side2,
            value: stats2,
          ),
          _Stats(
            side: 0,
            value: stats3,
          ),
        ],
      ),
    );
  }
}

class _Stats extends StatelessWidget {
  const _Stats({
    required this.side,
    required this.value,
  });

  final int side;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgWidget(
          side == 0 ? 'assets/status3.svg' : 'assets/side$side.svg',
          height: 28,
        ),
        SizedBox(height: 12),
        Text(
          side == 0 ? '$value draws' : '$value wins',
          style: TextStyle(
            color: Color(0xffFEFCFD),
            fontSize: 12,
            fontFamily: 'w600',
          ),
        ),
      ],
    );
  }
}
