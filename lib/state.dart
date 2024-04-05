import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyStateFullWidget extends StatefulWidget {
  const MyStateFullWidget({super.key});

  @override
  State<MyStateFullWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyStateFullWidget> {
  String text = "Saisir un text";
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    text = value.isEmpty ? "Saisir un text" : value;
                  });
                },
                keyboardType: TextInputType.text,
              ),
              GestureDetector(
                onTap: () => textController.text.isNotEmpty
                    ? showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              "Voulez vous ajouter",
                            ),
                            content: Text(textController.text),
                            actions: const [
                              Text("Valider"),
                            ],
                          );
                        },
                      )
                    : null,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade800,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                      child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "Ajouter",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void onPressed() {
    setState(() {
      text = "refresh clicked";
      if (kDebugMode) {
        print(text);
      }
    });
  }
}
