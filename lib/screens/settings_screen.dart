import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/custom_scaffold.dart';
import 'privacy_screen.dart';
import 'terms_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
          top: 76 + MediaQuery.of(context).viewPadding.top,
          bottom: 16,
        ),
        children: [
          Text(
            'Settings'.toUpperCase(),
            style: TextStyle(
              color: Color(0xffFEFCFD),
              fontSize: 32,
              fontFamily: 'w800',
            ),
          ),
          SizedBox(height: 20),
          _Tile(
            title: 'Notifications',
            onPressed: () {},
          ),
          _Tile(
            title: 'Privacy Policy',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PrivacyScreen();
                  },
                ),
              );
            },
          ),
          _Tile(
            title: 'Terms of use',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TermsScreen();
                  },
                ),
              );
            },
          ),
          _Tile(
            title: 'Share this app',
            onPressed: () {},
          ),
          _Tile(
            title: 'Rate us',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Color(0xff204AA1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Button(
        onPressed: onPressed,
        child: Row(
          children: [
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Color(0xffFEFCFD),
                fontSize: 16,
                fontFamily: 'w600',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
