import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 40),
      ),
    ),
  );
}