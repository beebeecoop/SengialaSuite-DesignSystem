import 'package:flutter/material.dart';
import 'sdc_surface.dart';

class SdcCard extends StatelessWidget {
  const SdcCard({super.key, required this.child, this.onTap});
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: SdcSurface(elevation: 1, child: child),
      );
}
