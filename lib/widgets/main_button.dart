import 'package:flutter/material.dart';

import 'button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    required this.type,
    required this.onPressed,
  });

  final String title;
  final int type;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        border: type == 1
            ? Border.all(
                width: 1,
                color: Color(0xff8BF846),
              )
            : null,
        gradient: LinearGradient(
          colors: type == 1
              ? [Color(0xff73E928), Color(0xff47B600)]
              : type == 2
                  ? [Color(0xff50DCFF), Color(0xff0298BD)]
                  : [Color(0xff204AA1), Color(0xff204AA1)],
        ),
        boxShadow: [
          BoxShadow(
            color: type == 1
                ? Color(0xff2E7700)
                : type == 2
                    ? Color(0xff0482A3)
                    : Color(0xff07338D),
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Button(
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xffFEFCFD),
              fontSize: 16,
              fontFamily: 'w600',
            ),
          ),
        ),
      ),
    );
  }
}
