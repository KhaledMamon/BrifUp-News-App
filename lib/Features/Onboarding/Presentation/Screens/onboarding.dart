import 'package:brifup_news/Core/Utils/root_screen.dart';
import 'package:brifup_news/Features/Onboarding/Presentation/widgets/onboarding_dots.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _data = [
    {
      "title": "Stay Informed.",
      "desc":
          "Get the latest news from around the world delivered to your fingertips.",
      "image": "images/1.png",
      "button": "Next",
    },
    {
      "title": "Personalized for You",
      "desc":
          "Customize your feed to follow the topics and sources you care about most.",
      "image": "images/2.png",
      "button": "Next",
    },
    {
      "title": "Read Anywhere",
      "desc":
          "Save articles to read later and stay updated even when you are offline.",
      "image": "images/3.png",
      "button": "Get Started",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: _data.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        // image outer the image space (if need)
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              _data[i]['image']!,
                              width: 320,
                              height: 380,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      Text(
                        _data[i]['title']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E2E2E),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        _data[i]['desc']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 110, 110, 110),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _data.length,
              (index) => DotIndicator(currentPage: _currentPage, index: index),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 25,
              bottom: 15,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 232, 43, 26),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 65),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              onPressed: () {
                if (_currentPage < 2) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.ease,
                  );
                } else {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const RootScreen()),
                    (Route<dynamic> route) => false,
                  );
                }
              },
              child: Text(
                _data[_currentPage]['button']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  if (_currentPage != 0) {
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Text(
                  _currentPage == 0 ? "" : "Back",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const RootScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text(
                  _currentPage == 2 ? "" : "Skip",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 25),
        ],
      ),
    );
  }
}
