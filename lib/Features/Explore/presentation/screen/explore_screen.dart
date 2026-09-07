import 'package:brifup_news/Features/Explore/model/explore_article_model.dart';
import 'package:brifup_news/Features/Home/Presentation/Screen/home.dart';
import 'package:brifup_news/Features/Bookmark/presentation/screen/bookmarks_screen.dart';
import 'package:brifup_news/Features/Profile/presentaion/screen/profile_screen.dart';
import 'package:flutter/material.dart';

import '../wediget/category_card.dart';
import '../wediget/recommended_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _currentIndex = 1;

  final List<Widget> _pages = const [
    HomeScreen(),
    ExploreScreen(),
    BookmarksScreen(),
    ProfileScreen(),
  ];

  final List<ExploreArticleModel> recommendedList = const [
    ExploreArticleModel(
      category: "Automotive",
      title: "The Future of EV Batteries: Longer Range, Faster Charging",
      description:
          "New solid-state battery technology promises to revolutionize electric...",
      time: "2h ago",
      imagePath: "images/recomanded1.png",
    ),
    ExploreArticleModel(
      category: "Urbanism",
      title: "Smart Cities: Reshaping Urban Life",
      description:
          "From traffic management to energy efficiency...",
      time: "4h ago",
      imagePath: "images/recomended2.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: _currentIndex == 1
          ? Explore(recommendedList: recommendedList)
          : _pages[_currentIndex],

   

       
    );
  }
}

class Explore extends StatelessWidget {
  const Explore({
    super.key,
    required this.recommendedList,
  });

  final List<ExploreArticleModel> recommendedList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: "Search news, topics, or authors...",
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.tune,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Explore Categories",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.1,
                    children: const [
                      CategoryCard(
                        title: "Sports",
                        imagePath: "images/Category Card1.png",
                        icon: Icons.flag,
                      ),
                      CategoryCard(
                        title: "Technology",
                        imagePath: "images/Category Card2.png",
                        icon: Icons.memory,
                      ),
                      CategoryCard(
                        title: "Politics",
                        imagePath: "images/Category Card3.webp",
                        icon: Icons.account_balance,
                      ),
                      CategoryCard(
                        title: "Health",
                        imagePath: "images/Category-Card4.png",
                        icon: Icons.local_hospital,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Recommended for You",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 290,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendedList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: RecommendedCard(
                            article: recommendedList[index],
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}