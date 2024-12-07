import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;
  const FilterButton({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      padding: const EdgeInsets.all(10),
      width: 90,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey[300]),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
