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
      validator: validator,
      controller: controller,
      obscureText: obsecure,
      keyboardType: keyBoardType,
      onTap: onTap,
      onChanged: onChanges,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(fontFamily: 'RoboStyle'),
        fillColor: Colors.white,
        prefixText: '   ',
        labelText: labelText,
        floatingLabelStyle:
            const TextStyle(fontFamily: 'RoboStyle', color: Colors.black),
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 0.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 0.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 0.5)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 0.5)),
      ),
    );
  }
}
