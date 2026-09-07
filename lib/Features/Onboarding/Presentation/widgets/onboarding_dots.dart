import 'package:flutter/material.dart';

class OnboardingDots extends StatelessWidget {
  final int currentPage;

  const OnboardingDots({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildDot(0),
        const SizedBox(width: 7),
        _buildDot(1),
        const SizedBox(width: 7),
        _buildDot(2),
      ],
    );
  }

  Widget _buildDot(int index) {
    final bool active = currentPage == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: active ? 27 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: active
            ? const Color(0xFFC8101E)
            : const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}