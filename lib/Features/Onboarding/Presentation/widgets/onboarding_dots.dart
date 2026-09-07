import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int index;
  final int currentPage;

  const DotIndicator({
    super.key,
    required this.index,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: currentPage == index ? 30 : 15,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentPage == index
            ? const Color.fromARGB(255, 232, 43, 26)
            : Colors.grey.shade300,
      ),
    );
  }
}
