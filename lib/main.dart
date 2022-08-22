import 'package:flutter/material.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NajeebAcademyApp.init();
  runApp(const NajeebAcademyApp());
}
