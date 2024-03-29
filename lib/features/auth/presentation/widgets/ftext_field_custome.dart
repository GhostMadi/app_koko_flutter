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
      validator: validator,
      controller: controller,
      obscureText: obsecure,
      keyboardType: keyBoardType,
      onTap: onTap,
      onChanged: onChanges,
      decoration: InputDecoration(
        prefixText: '   ',
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black, width: 3)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black, width: 3)),
      ),
    );
  }
}
