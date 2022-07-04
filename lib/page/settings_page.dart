import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>  Scaffold(
    body: Center(
      child: Text(
        "settings".i18n(),
        style: const TextStyle(fontSize: 40),
      ),
    ),
  );
}