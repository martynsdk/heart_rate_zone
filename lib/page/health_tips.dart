import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class HealthTips extends StatelessWidget {
  const HealthTips({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Text(
        "health_tips".i18n(),
        style: const TextStyle(fontSize: 40),
      ),
    ),
  );
}