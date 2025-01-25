import 'package:flutter/material.dart';

import 'button.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 150,
        width: 270,
        decoration: BoxDecoration(
          color: Color(0xff202531),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Spacer(),
            Text(
              'Exit the Game?',
              style: TextStyle(
                color: Color(0xffFFF6F6),
                fontSize: 16,
                fontFamily: 'w600',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                'If you exit the game, your progress will be lost. Are you sure you want to leave the game?',
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'w400',
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 1,
              width: double.infinity,
              color: Color(0xff808080).withValues(alpha: 55),
            ),
            Row(
              children: [
                Expanded(
                  child: Button(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    minSize: 44,
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xff007AFF),
                          fontSize: 16,
                          fontFamily: 'w600',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 44,
                  width: 1,
                  color: Color(0xff808080).withValues(alpha: 55),
                ),
                Expanded(
                  child: Button(
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    minSize: 44,
                    child: Center(
                      child: Text(
                        'Exit',
                        style: TextStyle(
                          color: Color(0xffF12E36),
                          fontSize: 16,
                          fontFamily: 'w600',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
