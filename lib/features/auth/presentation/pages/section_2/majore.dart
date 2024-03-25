import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MajoresSelect extends StatefulWidget {
  final String? school;
  const MajoresSelect({required this.school, Key? key}) : super(key: key);

  @override
  State<MajoresSelect> createState() => _MajoresSelectState();
}

Map<String, List<String>> majores = {
  'ISE': ['1', '2', '3', '4'],
  'KLS': ['5', '6', '7', '8'],
  'ISG': ['9', '0', '12', '24'],
  'SLA': ['13', '43', '23', '4'],
};

class _MajoresSelectState extends State<MajoresSelect> {
  late List<String>? selectedMajores;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    selectedMajores = majores[widget.school];
    return Container(
      width: size.width,
      height: size.height / 12,
      child: ListView.builder(
        itemCount: selectedMajores!.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
            ),
            child: Center(child: Text(selectedMajores![index])),
          );
        },
      ),
    );
  }
}
