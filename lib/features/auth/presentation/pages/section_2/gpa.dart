import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GpaWidget extends StatefulWidget {
  Function(double) callName;
  GpaWidget({required this.callName, super.key});

  @override
  State<GpaWidget> createState() => _GpaWidgetState();
}

final List<double> gpa = [1, 1.5, 2, 2.5, 2.7, 2.9, 3, 3.3, 3.5, 3.7, 3.8, 4];
double? selected;

class _GpaWidgetState extends State<GpaWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height / 18,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: gpa.length,
          itemBuilder: (contex, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selected = gpa[index];
                  widget.callName(selected!);
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(5),
                    color: selected == gpa[index] ? Colors.white : Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${gpa[index]}',
                      style: TextStyle(
                          color: selected == gpa[index]
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
