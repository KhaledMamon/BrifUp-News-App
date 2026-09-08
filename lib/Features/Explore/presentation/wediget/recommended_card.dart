import 'package:brifup_news/Features/Bookmark/Data/bookmark_store.dart';
import 'package:brifup_news/Features/Bookmark/Data/model/article_model.dart';
import 'package:brifup_news/Features/Explore/model/explore_article_model.dart';
import 'package:brifup_news/Core/Utils/app_image.dart';
import 'package:flutter/material.dart';

class RecommendedCard extends StatelessWidget {
  final ExploreArticleModel article;

  const RecommendedCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: AppImage(
              url: article.urlToImage,
              width: 220,
              height: 120,
              fallbackSeed: article.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (article.category ?? 'GENERAL').toUpperCase(),
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  article.description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      article.publishedAt ?? '',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 10,
                      ),
                    ),
                    ValueListenableBuilder<List<ArticleData>>(
                      valueListenable: bookmarksNotifier,
                      builder: (context, bookmarks, child) {
                        final savedArticle = ArticleData(
                          category: article.category ?? 'GENERAL',
                          title: article.title,
                          source: 'Explore',
                          time: article.publishedAt ?? '',
                          imagePath: article.urlToImage ?? '',
                          isNetworkImage: true,
                        );
                        final saved = bookmarks.any(
                          (item) =>
                              articleBookmarkId(
                                title: item.title,
                                source: item.source,
                              ) ==
                              articleBookmarkId(
                                title: savedArticle.title,
                                source: savedArticle.source,
                              ),
                        );

                        return GestureDetector(
                          onTap: () => toggleBookmark(savedArticle),
                          child: Icon(
                            saved ? Icons.bookmark : Icons.bookmark_border,
                            size: 16,
                            color: saved ? Colors.red : Colors.grey,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
