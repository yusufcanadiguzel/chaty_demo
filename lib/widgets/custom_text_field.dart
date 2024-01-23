import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final Icon iconData;
  final bool isObscure;
  late String textValue;

  CustomTextField({required this.labelText, required this.iconData, required this.textValue, this.isObscure = false, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => textValue = value,
        obscureText: isObscure,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 3.0,
              ),
          ),
          border: const OutlineInputBorder(),
          labelText: labelText,
          prefixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: iconData,
        ),
      ),
    );
  }
}
