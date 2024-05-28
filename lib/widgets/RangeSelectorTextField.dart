import 'package:flutter/material.dart';

class RangeSelectorTextField extends StatelessWidget {
  const RangeSelectorTextField(
      {super.key, required this.labelText, required this.onChange});

  final String labelText;
  final void Function(int value) onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelText),
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: true),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return "Must be an integer";
        } else {
          return null;
        }
      },
      onSaved: (newValue) => onChange(int.parse(newValue ?? "")),
    );
  }
}
