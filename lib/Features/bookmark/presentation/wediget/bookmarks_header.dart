import 'package:flutter/material.dart';

class BookmarksHeader extends StatelessWidget {
  final int articlesCount;
  final VoidCallback onFilterPressed;

  const BookmarksHeader({
    super.key,
    required this.articlesCount,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$articlesCount articles saved',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        TextButton.icon(
          onPressed: onFilterPressed,
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFFF1F1F1),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          icon: const Icon(Icons.filter_list, size: 16, color: Color(0xFFD71920)),
          label: const Text(
            'Filters',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF333333),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}