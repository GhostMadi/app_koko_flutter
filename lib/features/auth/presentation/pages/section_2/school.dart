import 'package:flutter/material.dart';

class SchoolSelect extends StatefulWidget {
  final Function(String) callName;
  const SchoolSelect({required this.callName, super.key});

  @override
  State<SchoolSelect> createState() => _SchoolSelectState();
}

class _SchoolSelectState extends State<SchoolSelect> {
  final List<String> schools = ['ISE', 'KLS', 'ISG', 'SLA'];
  String selected = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height / 12,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: schools.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selected = schools[index];
                  widget.callName(selected);
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  height: size.height / 12,
                  width: size.width / 4.5,
                  decoration: BoxDecoration(
                      color: selected == schools[index]
                          ? Colors.white
                          : Colors.black,
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      schools[index],
                      style: TextStyle(
                          color: selected == schools[index]
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
