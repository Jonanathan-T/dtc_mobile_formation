import 'package:flutter/material.dart';

import '../section/section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Stack(
            children: [
              PageView(
                scrollDirection: Axis.vertical,
                children: [
                  IntroductionSection(),
                  const ExperienceSection(),
                  FormationSection(),
                  SkillsSection(),
                ],
              ),
              const Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Text(
                  "Scroller",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x49607D8B),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
