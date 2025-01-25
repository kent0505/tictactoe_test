import 'package:flutter/material.dart';

import '../widgets/custom_scaffold.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

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
            'Terms of use'.toUpperCase(),
            style: TextStyle(
              color: Color(0xffFEFCFD),
              fontSize: 32,
              fontFamily: 'w800',
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Quisque sit amet eros rhoncus tellus pulvinar rhoncus. Curabitur sodales dignissim urna eu faucibus. Donec pretium facilisis mauris, sed faucibus erat commodo sit amet. Morbi et orci luctus, efficitur leo sit amet, pulvinar lectus. Nam facilisis ut orci sed elementum. Aenean in nisi ut dui malesuada condimentum. Sed in nisi vehicula, laoreet neque et, tincidunt quam. Maecenas malesuada in lectus quis sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent eleifend ut justo ut convallis.\n\nQuisque sit amet eros rhoncus tellus pulvinar rhoncus. Curabitur sodales dignissim urna eu faucibus. Donec pretium facilisis mauris, sed faucibus erat commodo sit amet. Morbi et orci luctus, efficitur leo sit amet, pulvinar lectus. Nam facilisis ut orci sed elementum. Aenean in nisi ut dui malesuada condimentum. Sed in nisi vehicula, laoreet neque et, tincidunt quam. Maecenas malesuada in lectus quis sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent eleifend ut justo ut convallis.',
            style: TextStyle(
              color: Color(0xff8793A8),
              fontSize: 14,
              fontFamily: 'w400',
            ),
          ),
        ],
      ),
    );
  }
}
