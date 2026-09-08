import 'package:brifup_news/Features/Explore/model/explore_article_model.dart';
import 'package:brifup_news/Features/Explore/model/news_api_service.dart';
import 'package:flutter/material.dart';
import 'package:brifup_news/Core/Utils/app_localizations.dart';
import 'package:brifup_news/Core/Utils/app_shell.dart';

import '../wediget/category_card.dart';
import '../wediget/recommended_card.dart';
import 'category_news_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  final List<ExploreArticleModel> recommendedList = const [
    ExploreArticleModel(
      category: "Automotive",
      title: "The Future of EV Batteries: Longer Range, Faster Charging",
      description:
          "New solid-state battery technology promises to revolutionize electric...",
      publishedAt: "2h ago",
      urlToImage: "images/recomanded1.png",
    ),
    ExploreArticleModel(
      category: "Urbanism",
      title: "Smart Cities: Reshaping Urban Life",
      description: "From traffic management to energy efficiency...",
      publishedAt: "4h ago",
      urlToImage: "images/recomended2.jpg",
    ),
  ];

  void _onCategoryTap(
    BuildContext context,
    String categoryName,
    String apiKeyCategory,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    NewsApiService apiService = NewsApiService();
    List<ExploreArticleModel> articles = await apiService.getArticlesByCategory(
      apiKeyCategory,
    );

    if (context.mounted) {
      Navigator.of(context, rootNavigator: true).pop();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryNewsScreen(
            categoryTitle: categoryName,
            articles: articles,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppHeader(title: strings.explore),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Search news, topics, or authors...",
                    hintStyle: TextStyle(fontSize: 13, color: theme.hintColor),
                    border: InputBorder.none,
                    suffixIcon: const Icon(Icons.tune, size: 20),
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
                    Text(
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
                      children: [
                        CategoryCard(
                          title: "Sports",
                          imagePath: "images/Category Card1.png",
                          icon: Icons.flag,
                          onTap: () =>
                              _onCategoryTap(context, "Sports", "sports"),
                        ),
                        CategoryCard(
                          title: "Technology",
                          imagePath: "images/Category Card2.png",
                          icon: Icons.memory,
                          onTap: () => _onCategoryTap(
                            context,
                            "Technology",
                            "technology",
                          ),
                        ),
                        CategoryCard(
                          title: "Business",
                          imagePath: "images/Business.png",
                          icon: Icons.business,
                          onTap: () =>
                              _onCategoryTap(context, "Business", "business"),
                        ),
                        CategoryCard(
                          title: "Health",
                          imagePath: "images/CategoryCard4.png",
                          icon: Icons.local_hospital,
                          onTap: () =>
                              _onCategoryTap(context, "Health", "health"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Text(
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
      ),
    );
  }
}
