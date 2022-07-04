import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Text(
        "profiles".i18n(),
        style: const TextStyle(fontSize: 40),
      ),
    ),
  );
}