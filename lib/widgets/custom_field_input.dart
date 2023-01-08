import 'package:flutter/material.dart';

class CustomFieldInput extends StatelessWidget {
  final String? labelText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final bool obscureText;
  const CustomFieldInput({
    Key? key,
    this.labelText,
    this.icon,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: false,
        initialValue: '',
        obscureText: obscureText,
        keyboardType: keyboardType,
        textCapitalization: TextCapitalization.words,
        validator: (value) {
          if (value == null) return 'Este campo es requerido';
          return value.length < 3
              ? 'El campo debe tener minimo 3 caracteres '
              : null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          icon: icon == null ? null : Icon(icon),
          labelText: labelText,
        ));
  }
}
