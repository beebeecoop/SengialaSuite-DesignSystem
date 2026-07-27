import 'package:flutter/material.dart';

class SdcProgressIndicator extends StatelessWidget {
  const SdcProgressIndicator({super.key, this.value, this.label});
  final double? value;
  final String? label;

  @override
  Widget build(BuildContext context) => Semantics(
        label: label,
        value: value == null ? null : '${(value! * 100).round()}%',
        child: LinearProgressIndicator(value: value),
      );
}
