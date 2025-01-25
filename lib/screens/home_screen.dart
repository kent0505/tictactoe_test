import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/tennis/tennis_bloc.dart';
import '../widgets/loading_widget.dart';
import '../widgets/main_button.dart';
import '../widgets/svg_widget.dart';
import 'rules_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TennisBloc, TennisState>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Opacity(
                  opacity: state is TennisLoaded ? 1 : 0,
                  child: SvgWidget('assets/bg1.svg'),
                ),
              ),
              Positioned(
                top: 32,
                right: 220,
                child: Opacity(
                  opacity: state is TennisLoaded ? 1 : 0,
                  child: SvgWidget('assets/bg2.svg'),
                ),
              ),
              Positioned(
                top: 190,
                right: -32,
                child: Opacity(
                  opacity: state is TennisLoaded ? 1 : 0,
                  child: SvgWidget('assets/bg2.svg'),
                ),
              ),
              state is TennisLoading
                  ? LoadingWidget()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(
                            'tennis tic tac toe'.toUpperCase(),
                            style: TextStyle(
                              color: Color(0xffFEFCFD),
                              fontSize: 32,
                              fontFamily: 'w800',
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Welcome to the court! Choose your game mode, set up your match, and start your battle for the championship title.',
                            style: TextStyle(
                              color: Color(0xff8793A8),
                              fontSize: 14,
                              fontFamily: 'w400',
                            ),
                          ),
                          SizedBox(height: 42),
                          MainButton(
                            title: 'Single player',
                            type: 1,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RulesScreen(single: true);
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 12),
                          MainButton(
                            title: 'Multiplayer',
                            type: 2,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RulesScreen(single: false);
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 12),
                          MainButton(
                            title: 'Settings',
                            type: 3,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SettingsScreen();
                                  },
                                ),
                              );
                            },
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
