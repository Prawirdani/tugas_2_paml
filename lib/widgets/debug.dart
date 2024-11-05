import 'package:flutter/material.dart';

class DebugWidget extends StatelessWidget {
  final Widget child;
  const DebugWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.red),
      ),
      child: child,
    );
  }
}
