import 'package:ct_meter_new/ct_new_service/ct_new_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // ✅ Only calling another widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CtNewService(),
    );
  }
}


