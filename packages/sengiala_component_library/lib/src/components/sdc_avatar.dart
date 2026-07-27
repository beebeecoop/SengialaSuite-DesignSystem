import 'package:flutter/material.dart';

class SdcAvatar extends StatelessWidget {
  const SdcAvatar({super.key, this.image, this.initials, this.radius = 20});
  final ImageProvider? image;
  final String? initials;
  final double radius;

  @override
  Widget build(BuildContext context) => CircleAvatar(
        radius: radius,
        backgroundImage: image,
        child: image == null ? Text(initials ?? '') : null,
      );
}
