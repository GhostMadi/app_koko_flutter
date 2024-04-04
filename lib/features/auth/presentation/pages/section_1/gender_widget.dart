import 'package:flutter/material.dart';

class GenderSelect extends StatefulWidget {
  final Function(String) callName;
  const GenderSelect({required this.callName, super.key});

  @override
  State<GenderSelect> createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  final List<String> genders = ['Male', 'Femal'];
  String selected = " ";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height / 12,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genders.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selected = genders[index];
                  widget.callName(selected);
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  height: size.height / 12,
                  width: size.width / 2.3,
                  decoration: BoxDecoration(
                      color: selected == genders[index]
                          ? Colors.white
                          : Colors.black,
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                    child: Text(
                      genders[index],
                      style: TextStyle(
                          fontFamily: 'BungeeShade',
                          color: selected == genders[index]
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
