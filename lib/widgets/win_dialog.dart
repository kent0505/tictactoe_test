import 'package:flutter/material.dart';

import 'main_button.dart';
import 'svg_widget.dart';

class WinDialog extends StatelessWidget {
  const WinDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 460,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xff083697),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(height: 22),
              SvgWidget('assets/win.svg'),
              SizedBox(height: 24),
              Text(
                'Congratulations! You won the set!',
                style: TextStyle(
                  color: Color(0xffFEFCFD),
                  fontSize: 16,
                  fontFamily: 'w600',
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Your shot was perfect, and you’ve claimed victory in this set! Are you ready to continue the match and secure your win, or would you like to return to the home screen?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff8793A8),
                  fontSize: 14,
                  fontFamily: 'w400',
                ),
              ),
              SizedBox(height: 30),
              MainButton(
                title: 'Continue',
                type: 1,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 12),
              MainButton(
                title: 'Go Home',
                type: 2,
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
