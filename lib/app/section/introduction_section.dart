import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroductionSection extends StatelessWidget {
  IntroductionSection({super.key});
  final linkedinUrl =
      Uri.parse("https://www.linkedin.com/in/jonathan-totozamany-2505b91a1");
  final githubUrl = Uri.parse("https://github.com/Jonanathan-T");
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double ratio = width / 2;
    double radius = 15.0;
    double padding = 5.0;

    return SizedBox(
      height: height - height / 4,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF0164F8),
                  Color(0xFF1CE6ED),
                ],
              ),
              borderRadius: BorderRadius.circular(radius + padding),
            ),
            width: ratio,
            height: ratio,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.asset(
                  "assets/images/photo.jpg",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
            child: RichText(
              text: const TextSpan(
                text:
                    "Hi! 👋,\nJe suis TOTOZAMANY Jonathan\nDeveloppeur d'application mobile\n\n",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text:
                        "À la recherche d’une opportunité passionnante pour débuter ma carrière en tant que développeur mobile junior, je suis a la recherche d’une stage de pré-embauche afin d’améliorer mes compétences et d’acquérir plus d’expériences pratique dans le domaine de l’informatique et de l’innovation Technologique.",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  if (!await launchUrl(githubUrl)) {
                    throw Exception('Could not launch $githubUrl');
                  }
                },
                child: Image.asset(
                  "assets/logos/github_512px.png",
                  height: 48.0,
                  width: 48.0,
                ),
              ),
              const SizedBox(width: 15.0),
              GestureDetector(
                onTap: () async {
                  if (!await launchUrl(linkedinUrl)) {
                    throw Exception('Could not launch $linkedinUrl');
                  }
                },
                child: Image.asset(
                  "assets/logos/linkedin_96px.png",
                  height: 48.0,
                  width: 48.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
