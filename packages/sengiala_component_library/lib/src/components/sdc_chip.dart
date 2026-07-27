import 'package:flutter/material.dart';

class SdcChip extends StatelessWidget {
  const SdcChip({super.key, required this.label, this.selected = false, this.onSelected, this.icon});
  final String label;
  final bool selected;
  final ValueChanged<bool>? onSelected;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => FilterChip(
        label: Text(label),
        avatar: icon == null ? null : Icon(icon, size: 16),
        selected: selected,
        onSelected: onSelected,
      );
}
