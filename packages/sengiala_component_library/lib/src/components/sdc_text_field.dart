import 'package:flutter/material.dart';

class SdcTextField extends StatelessWidget {
  const SdcTextField({super.key, this.controller, this.label, this.hint, this.errorText, this.onChanged, this.enabled = true, this.obscureText = false});
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool obscureText;

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        enabled: enabled,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(labelText: label, hintText: hint, errorText: errorText, border: const OutlineInputBorder()),
      );
}
