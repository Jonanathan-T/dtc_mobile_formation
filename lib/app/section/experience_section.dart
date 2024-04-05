import 'package:flutter/material.dart';

import '../entities/information.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  final experiences = <Information>[
    Information(
      title:
          "Création d’une application mobile d’achat en ligne des produits d’un restaurant « Family’s Soupe » avec Flutter (2023 - En cours)",
      details: ["Projet personnelle"],
    ),
    Information(
      title:
          "Création de Bot Messenger avec le Framework Ampalibe (2022 - 2023)",
      details: [
        "Projet d’étude",
        "Développeur",
      ],
    ),
    Information(
      title:
          "Refactorisation de l’application « lapub.mg » en utilisant la Clean Architecture (2022)",
      details: [
        "Apprentissage de la clean architecture",
      ],
    ),
    Information(
      title:
          "Création d’une application mobile de consultation de prospectus, de catalogue et brochures des entreprises « lapub.mg », Toamasina (2021 - 3 mois)",
      details: [
        "Projet de fin d’étude du premier cycle",
        "Stagiaire chez INOVATIC Madagascar",
      ],
    ),
    Information(
      title: "Challenge personnel intégration de maquette avec Flutter (2020)",
      details: [
        "Integrateur d'Interface Utilisateur",
      ],
    ),
    Information(
      title: "Participation à l'Open Days 7e Edition, Toamasina (2020)",
      details: [
        "Coréalisation d'un soudeur Bot",
        "Responsable de la partie programmation",
        "Projet au sein de l'association Robotika261",
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(experiences.length + 1, (index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                "Experience",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
          final experience = experiences[index - 1];
          return Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: RichText(
              text: TextSpan(
                text: experience.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                children: List<InlineSpan>.generate(
                  experience.details.length,
                  (index) => TextSpan(
                    text: "\n- ${experience.details[index]}",
                    style: const TextStyle(color: Colors.white60),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
