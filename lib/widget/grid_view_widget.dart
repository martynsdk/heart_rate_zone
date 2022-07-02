import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final List<String> urlImages;

  const GridViewWidget({
    @required this.urlImages,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GridView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(4),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
    ),
    children: urlImages
        .map((urlImage) => Image.network(urlImage, fit: BoxFit.cover))
        .toList(),
  );
}