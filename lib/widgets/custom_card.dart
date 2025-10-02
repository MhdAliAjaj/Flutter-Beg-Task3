import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? text;
  final Widget? child;

  const CustomCard({super.key, this.text, this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: text != null ? Text(text!, textAlign: TextAlign.center) : child,
      ),
    );
  }
}
