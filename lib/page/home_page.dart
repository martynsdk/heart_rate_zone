import 'package:flutter/material.dart';
import 'package:heart_rate_zone/widget/grid_view_widget.dart';

class HomePage extends StatelessWidget {
  final urlImages = [
    'https://images.unsplash.com/photo-1490578474895-699cd4e2cf59?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80',
    'https://images.unsplash.com/photo-1504834636679-cd3acd047c06?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80'
  ];

  @override
  Widget build(BuildContext context) => GridViewWidget(urlImages: urlImages);
}