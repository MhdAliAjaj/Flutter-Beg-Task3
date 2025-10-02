import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  const SocialButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        shape: BoxShape.circle,
      ),
      child: Center(child: Text(icon, style: const TextStyle(fontSize: 22))),
    );
  }
}
