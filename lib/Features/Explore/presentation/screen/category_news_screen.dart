import 'package:brifup_news/Features/Explore/model/explore_article_model.dart';
import 'package:brifup_news/Core/Utils/app_image.dart';
import 'package:brifup_news/Core/Utils/app_shell.dart';
import 'package:flutter/material.dart';

class CategoryNewsScreen extends StatelessWidget {
  final String categoryTitle;
  final List<ExploreArticleModel> articles;

  const CategoryNewsScreen({
    super.key,
    required this.categoryTitle,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppHeader(title: categoryTitle, showBack: true),
      drawer: const AppDrawer(),
      body: articles.isEmpty
          ? const Center(child: Text("لا توجد أخبار المتاحة لهذا القسم حالياً"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: AppImage(
                          url: article.urlToImage,
                          width: 90,
                          height: 90,
                          fallbackSeed: article.title,
                        ),
                      ),
                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              article.description ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
