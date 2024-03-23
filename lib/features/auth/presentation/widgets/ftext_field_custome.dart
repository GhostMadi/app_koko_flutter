import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecure;
  final TextInputType keyBoardType;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final String? errorMsg;
  final String? Function(String?)? onChanges;
  const CustomTextField(
      {required this.controller,
      required this.hintText,
      required this.obsecure,
      required this.keyBoardType,
      this.errorMsg,
      this.onChanges,
      this.onTap,
      this.validator,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 12,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obsecure,
          keyboardType: keyBoardType,
          onTap: onTap,
          onChanged: onChanges,
          decoration: InputDecoration(
              border: InputBorder.none,
              errorText: errorMsg,
              hintText: hintText),
        ),
      ),
    );
  }
}
