import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ifes_solar/core/app.dart';

void main() async {
  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  if (isProduction) {
    await dotenv.load(fileName: ".env.production");
  } else {
    await dotenv.load(fileName: ".env");
  }
  runApp(App());
}
