import 'package:flutter/material.dart';

class SdcButton extends StatelessWidget {
  const SdcButton({super.key, required this.label, this.onPressed, this.icon, this.loading = false});

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final child = loading
        ? const SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2))
        : Text(label);
    return icon == null
        ? FilledButton(onPressed: loading ? null : onPressed, child: child)
        : FilledButton.icon(onPressed: loading ? null : onPressed, icon: Icon(icon), label: child);
  }
}
