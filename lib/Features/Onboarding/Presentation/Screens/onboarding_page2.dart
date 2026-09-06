import 'package:flutter/material.dart';

import '../../Data/models/model.dart';
import '../widgets/onboarding_dots.dart';

class OnboardingPage2 extends StatelessWidget {
  final OnboardingModel model;
  final int currentPage;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const OnboardingPage2({
    super.key,
    required this.model,
    required this.currentPage,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // IMAGE
        Positioned.fill(
          child: Image.asset(
            model.image!,
            fit: BoxFit.cover,
          ),
        ),

        // GRADIENT
        Positioned(
          left: 0,
          right: 0,
          bottom: 200,
          height: 250,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0xFFF8F8F8),
                ],
              ),
            ),
          ),
        ),

        // SKIP
        Positioned(
          top: 40,
          right: 18,
          child: TextButton(
            onPressed: onSkip,
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color(0xFF666666),
                fontSize: 13,
              ),
            ),
          ),
        ),

        // BOTTOM CONTENT
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(
              16,
              18,
              16,
              12,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(22),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Personalized for You',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  model.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.4,
                    color: Color(0xFF666666),
                  ),
                ),

                // نفس مكان الـ dots
                const SizedBox(height: 18),

                OnboardingDots(
                  currentPage: currentPage,
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC8101E),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
                ),

                const SizedBox(height: 2),

                SizedBox(
                  height: 36,
                  child: TextButton(
                    onPressed: onSkip,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}