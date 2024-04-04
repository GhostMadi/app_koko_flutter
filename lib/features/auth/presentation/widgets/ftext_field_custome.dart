import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obsecure;
  final TextInputType keyBoardType;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final String? errorMsg;
  final String? Function(String?)? onChanges;
  const CustomTextField(
      {required this.controller,
      required this.labelText,
      required this.obsecure,
      required this.keyBoardType,
      this.errorMsg,
      this.onChanges,
      this.onTap,
      this.validator,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: const TextStyle(fontFamily: 'Bungee'),
      validator: validator,
      controller: controller,
      obscureText: obsecure,
      keyboardType: keyBoardType,
      onTap: onTap,
      onChanged: onChanges,
      decoration: InputDecoration(
        labelStyle: const TextStyle(fontFamily: 'BungeeShade'),
        floatingLabelStyle:
            const TextStyle(fontFamily: 'BungeeShade', color: Colors.black),
        hintStyle: const TextStyle(fontFamily: 'BungeeShade'),
        filled: true,
        fillColor: Colors.white,
        prefixText: '   ',
        labelText: labelText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white)),
      ),
    );
  }
}
