import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/data/constants/colors.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    required this.contoller,
    required this.hint,
    required this.obscured,
  }) : super(key: key);
  final TextEditingController contoller;
  final String hint;
  final bool obscured;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: const NeumorphicStyle(
        depth: -3,
        shadowLightColor: lightInputFieldLightColor,
        shadowDarkColor: lightInputFieldShadeColor,
      ),
      child: TextField(
        textAlign: TextAlign.center,
        controller: widget.contoller,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: "Sansita",
        ),
        obscureText: widget.obscured,
        decoration: InputDecoration(
            fillColor: lightPageMainColor,
            filled: true,
            hintStyle: const TextStyle(color: Color(0xff9893A1)),
            hintText: widget.hint,
            border: InputBorder.none),
      ),
    );
  }
}