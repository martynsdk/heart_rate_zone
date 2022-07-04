import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(
      child: Text(
        'Favourites',
        style: TextStyle(fontSize: 40),
      ),
    ),
  );
}