import 'package:flutter/material.dart';

class SdcIconButton extends StatelessWidget {
  const SdcIconButton({super.key, required this.icon, required this.tooltip, this.onPressed});

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        tooltip: tooltip,
      );
}
