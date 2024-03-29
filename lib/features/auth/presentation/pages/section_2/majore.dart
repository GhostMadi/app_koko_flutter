import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MajoresSelect extends StatefulWidget {
  final String school;
  Function(String) callName;
  MajoresSelect({required this.callName, required this.school, super.key});

  @override
  State<MajoresSelect> createState() => _MajoresSelectState();
}

Map<String, List<String>> majores = {
  'ISE': [
    'finance',
    'accounting',
    'economics and data science',
    'marketing',
    'IT in bussines',
    'International Relations',
    'Concentrations',
    'HR management',
    'supply chain mangement',
    'entrepreneurship'
  ],
  'HSL': ['international law', 'jurisprudence', 'rights and law enforcement'],
  'HSH': [
    'translation business',
    'applied linguistics',
    'hospitality',
    'tourism',
    'linguistics',
    'psychology'
  ],
  'ISJ': ['international journalism'],
};

String selected = '';

class _MajoresSelectState extends State<MajoresSelect> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height / 12,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: majores[widget.school]!.length,
          itemBuilder: (context, index) {
            List<String> majore = majores[widget.school]!;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selected = majore[index];
                  widget.callName(selected);
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  height: size.height / 12,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(15),
                      color: selected == majore[index]
                          ? Colors.white
                          : Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      majore[index],
                      style: TextStyle(
                          color: selected == majore[index]
                              ? Colors.black
                              : Colors.white),
                    )),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
