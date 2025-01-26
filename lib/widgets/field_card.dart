import 'package:flutter/material.dart';

import 'button.dart';
import 'svg_widget.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({
    super.key,
    required this.index,
    required this.id,
    required this.green,
    required this.onPressed,
  });

  final int index;
  final int id;
  final bool green;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: id == 0
          ? () {
              onPressed(index);
            }
          : null,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        height: 112,
        width: 112,
        margin: EdgeInsets.all(3),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: green ? Color(0xff007206) : Color(0xff204AA1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: id == 0
            ? null
            : Center(
                child: SvgWidget('assets/side$id.svg'),
              ),
      ),
    );
  }
}
