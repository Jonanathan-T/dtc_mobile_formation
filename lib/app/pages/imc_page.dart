import 'package:flutter/material.dart';

import '../entities/entities.dart';
import '../widgets/widgets.dart';
import 'pages.dart';

class ImcPage extends StatefulWidget {
  static const name = "/imc_page";
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  late TextEditingController poidsControlleur;
  late TextEditingController tailleControlleur;
  final response = <double, String>{
    18.5: "Poids insuffisant",
    24.9: "Poids normale",
    30.0: "Excès de poids",
  };
  @override
  void initState() {
    poidsControlleur = TextEditingController(text: "68");
    tailleControlleur = TextEditingController(text: "166");
    super.initState();
  }

  @override
  void dispose() {
    poidsControlleur.dispose();
    tailleControlleur.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calcule IMC"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Poids (kg)",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            TextField(
              controller: poidsControlleur,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            const Text(
              "Taille (cm)",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            TextField(
              controller: tailleControlleur,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (!validation()) {
                  _showDialogResult();
                }
              },
              child: Button(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade800,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                text: "Calculer et afficher avec un dialogue",
              ),
            ),
            GestureDetector(
              onTap: () {
                if (!validation()) {
                  final imc = calculeImc();
                  Navigator.pushNamed(
                    context,
                    ResultImcPage.name,
                    arguments: resultImc(imc),
                  );
                }
              },
              child: Button(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFe100ff),
                      Color(0xFF7f00ff),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                text: "Calculer et afficher dans une autre page",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            poidsControlleur.text = "";
            tailleControlleur.text = "";
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  ResultImc resultImc(double imc) {
    late Color couleur = Colors.orange;
    late String message = "Obesité";
    if (imc <= 18.5) {
      message = response[18.5]!;
      couleur = Colors.cyan;
    }
    if (imc > 18.5 && imc < 25.0) {
      message = response[24.9]!;
      couleur = Colors.green;
    }
    if (imc >= 25.0 && imc < 30) {
      message = response[30.0]!;
      couleur = Colors.orange.shade900;
    }
    return ResultImc(imc: imc, message: message, color: couleur);
  }

  double calculeImc() {
    double poids = double.parse(poidsControlleur.text);
    double taille = double.parse(tailleControlleur.text) / 100;
    return (poids / (taille * taille)).floorToDouble();
  }

  bool validation() {
    final snackBar = SnackBar(
      content: const Text("Tout les champs sont obligatoires"),
      backgroundColor: Colors.redAccent.shade400,
    );
    if (poidsControlleur.text.isEmpty || tailleControlleur.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return true;
    }
    return false;
  }

  void _showDialogResult() {
    final result = resultImc(calculeImc());

    showDialog(
      context: context,
      builder: ((context) {
        return SimpleDialog(
          title: SizedBox(
            height: MediaQuery.sizeOf(context).height / 4,
            child: Column(
              children: [
                Text(
                  "Votre IMC: ${result.imc}",
                  style: const TextStyle(fontSize: 24.0),
                ),
                Text(result.message),
              ],
            ),
          ),
          titleTextStyle: const TextStyle(color: Colors.white),
          backgroundColor: result.color,
        );
      }),
    );
  }
}
