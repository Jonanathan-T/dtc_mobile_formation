import 'package:flutter/material.dart';

import '../entities/entities.dart';

class ResultImcPage extends StatelessWidget {
  static const name = "/result_imc";
  final ResultImc? resultImc;
  const ResultImcPage({super.key, required this.resultImc});

  @override
  Widget build(BuildContext context) {
    final ResultImc result =
        resultImc ?? ModalRoute.of(context)!.settings.arguments as ResultImc;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Votre IMC: ${result.imc}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: result.color,
      ),
      body: Center(
        child: Text(
          result.message,
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
