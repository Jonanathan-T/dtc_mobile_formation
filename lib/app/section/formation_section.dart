import 'package:dtc_first_app/app/entities/information.dart';
import 'package:flutter/material.dart';

class FormationSection extends StatelessWidget {
  FormationSection({super.key});

  final bodyColor = Colors.white60;
  final formations = <Information>[
    Information(
      title: "Formation en Developpement Mobile, Antananarivo (2024)",
      details: ["Digital Training Center 3e Vague"],
    ),
    Information(
      title: "Etudiant en Informatique, Antananarivo (2017 - 2023)",
      details: [
        "Institut Superieur Polytechnique de Madagascar",
        "Informatique de Gestion, Génie Logiciel et Intelligence Artificielle",
      ],
    ),
    Information(
      title:
          "Formation en Internet Of Things \"Maison Connectée\", Toamasina (2019)",
      details: ["Certifié Open Days 2019 par l'ONG Jade"],
    ),
    Information(
      title: "Baccalauréat série C, Toamasina (2017)",
      details: ["Lycée Jacques Rabemananjara"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(
          formations.length + 1,
          (index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Formation",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(
                      "assets/logos/diploma_480px.png",
                      height: 30.0,
                      width: 30.0,
                    ),
                  ],
                ),
              );
            }
            final formation = formations[index - 1];
            return Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: RichText(
                text: TextSpan(
                  text: formation.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  children: List<InlineSpan>.generate(
                    formation.details.length,
                    (index) => TextSpan(
                      text: "\n- ${formation.details[index]}",
                      style: TextStyle(color: bodyColor),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
