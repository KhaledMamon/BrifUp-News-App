import 'package:flutter/material.dart';

import '../../Data/datasourse/datasours.dart';
import 'onboarding_page1.dart';
import 'onboarding_page2.dart';
import 'onboarding_page3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < 2) {
      _pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      // TODO: Navigate to Home Screen
    }
  }

  void skip() {
    _pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        children: [
          OnboardingPage1(
            model: OnboardingDatasource.pages[0],
            currentPage: currentPage,
            onNext: nextPage,
            onSkip: skip,
          ),

          OnboardingPage2(
            model: OnboardingDatasource.pages[1],
            currentPage: currentPage,
            onNext: nextPage,
            onSkip: skip,
          ),

          OnboardingPage3(
            model: OnboardingDatasource.pages[2],
            currentPage: currentPage,
            onGetStarted: nextPage,
          ),
        ],
      ),
    );
  }
}