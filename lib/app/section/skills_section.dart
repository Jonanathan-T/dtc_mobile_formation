import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});
  final programmation = <String>[
    "assets/logos/dart_480px.png",
    "assets/logos/flutter_480px.png",
    "assets/logos/c_sharp_logo_2_480px.png",
    "assets/logos/java_480px.png",
    "assets/logos/php_480px.png",
    "assets/logos/arduino_480px.png",
    "assets/logos/sql_480px.png",
    "assets/logos/postgresql_480px.png",
    "assets/logos/mongodb_480px.png",
  ];

  final tools = <String>[
    "assets/logos/visual_studio_code_2019_480px.png",
    "assets/logos/visual_studio_2019_480px.png",
    "assets/logos/intellij_idea_480px.png",
    "assets/logos/studio.png",
    "assets/logos/git_480px.png",
    "assets/logos/github_480px.png",
    "assets/logos/docker_480px.png",
    "assets/logos/adobe_photoshop_480px.png",
    "assets/logos/trello_480px.png",
    "assets/logos/office_365_480px.png",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              "Competences ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Wrap(
            spacing: 5,
            children: List.generate(
              programmation.length,
              (index) => SizedBox(
                height: 50.0,
                width: 50.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    programmation[index],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50.0),
          Wrap(
            spacing: 5,
            children: List.generate(
              tools.length,
              (index) => SizedBox(
                height: 50.0,
                width: 50.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    tools[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
