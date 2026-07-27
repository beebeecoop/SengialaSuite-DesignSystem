import 'package:flutter/material.dart';
import '../foundation/sdc_tokens.dart';

class SdcSurface extends StatelessWidget {
  const SdcSurface({super.key, required this.child, this.padding = const EdgeInsets.all(SdcSpacing.md), this.elevation = 0});
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double elevation;

  @override
  Widget build(BuildContext context) => Material(
        elevation: elevation,
        color: Theme.of(context).colorScheme.surface,
        borderRadius: SdcRadius.md,
        child: Padding(padding: padding, child: child),
      );
}
