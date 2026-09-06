import '../models/model.dart';

class OnboardingDatasource {
  static const List<OnboardingModel> pages = [
    OnboardingModel(
      title: 'Stay Informed.',
      description:
      'Get the latest news from around the world delivered to your fingertips.',
      image: 'assets/onboarding1.png',
    ),

    OnboardingModel(
      title: 'Personalized for You',
      description:
      'Customize your feed to follow the topics and sources you care about most.',
      image: 'assets/onboarding2.png',
    ),

    OnboardingModel(
      title: 'Read Anywhere',
      description:
      'Save articles to read later and stay updated even when you are offline.',
      image: 'assets/onboarding3.png',
    ),
  ];
}