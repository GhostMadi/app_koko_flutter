import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String buttonText;
  const CustomButton(
      {required this.buttonText, required this.onTap, super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 11.5,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Center(
          child: Text(
            ' ${widget.buttonText}',
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: "BungeeShade"),
          ),
        ),
      ),
    );
  }
}
