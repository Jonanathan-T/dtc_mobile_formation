import 'package:device_preview_minus/device_preview_minus.dart';
import 'package:flutter/material.dart';

import 'pages/pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcule IMC',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: ImcPage.name,
      routes: <String, WidgetBuilder>{
        ImcPage.name: (context) => const ImcPage(),
        ResultImcPage.name: (context) => const ResultImcPage(resultImc: null),
      },
    );
  }
}
