import 'package:dars90_amaliyot/app/app.dart';
import 'package:dars90_amaliyot/core/get_it.dart';
import 'package:flutter/material.dart';

void main() {
  dependencyInit();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
