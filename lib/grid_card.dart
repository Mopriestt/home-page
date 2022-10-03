import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final Widget child;
  final VoidCallback onClick;
  const GridCard({super.key, required this.child, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onClick, child: Card(child: child));
  }
}