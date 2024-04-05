import 'package:device_preview_minus/device_preview_minus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => const App(),
    ),
  );
}
