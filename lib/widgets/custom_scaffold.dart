import 'package:flutter/material.dart';

import 'button.dart';
import 'exit_dialog.dart';
import 'svg_widget.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.exit = false,
  });

  final Widget body;
  final bool exit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 32,
            right: 220,
            child: Opacity(
              opacity: 0.2,
              child: SvgWidget('assets/bg2.svg'),
            ),
          ),
          Positioned(
            top: 32,
            right: 22,
            child: Opacity(
              opacity: 0.2,
              child: SvgWidget('assets/bg2.svg'),
            ),
          ),
          Positioned(
            top: 190,
            right: -32,
            child: Opacity(
              opacity: 0.2,
              child: SvgWidget('assets/bg2.svg'),
            ),
          ),
          Positioned(
            top: 80,
            left: 34,
            right: 34,
            child: _Line1(),
          ),
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            child: _Line1(),
          ),
          Positioned(
            top: 0,
            left: 34,
            child: _Line2(height: 240),
          ),
          Positioned(
            top: 0,
            right: 34,
            child: _Line2(height: 240),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child: _Line2(height: 160),
            ),
          ),
          body,
          Positioned(
            top: 16 + MediaQuery.of(context).viewPadding.top,
            left: 16,
            child: Button(
              onPressed: () {
                exit
                    ? showDialog(
                        context: context,
                        builder: (context) {
                          return ExitDialog();
                        },
                      )
                    : Navigator.pop(context);
              },
              child: SvgWidget('assets/back.svg'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Line1 extends StatelessWidget {
  const _Line1();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.white.withValues(alpha: 0.2),
    );
  }
}

class _Line2 extends StatelessWidget {
  const _Line2({this.height = 80});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: height,
      color: Colors.white.withValues(alpha: 0.2),
    );
  }
}
