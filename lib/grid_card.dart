import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final Widget child;
  final VoidCallback onClick;
  final Color? color;

  const GridCard({
    super.key,
    required this.child,
    required this.onClick,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        color: color,
        child: child,
      ),
    );
  }
}
