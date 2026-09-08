import 'package:brifup_news/Features/Bookmark/Data/model/article_model.dart';
import 'package:brifup_news/Features/Home/Data/models/model.dart';
import 'package:flutter/foundation.dart';

final ValueNotifier<List<ArticleData>> bookmarksNotifier =
    ValueNotifier<List<ArticleData>>(<ArticleData>[]);

String articleBookmarkId({required String? title, required String? source}) =>
    '${source ?? ''}|${title ?? ''}';

ArticleData articleDataFromNews(NewsModel news) {
  return ArticleData(
    category: news.country ?? 'US',
    title: news.title ?? 'No Title',
    source: news.journal ?? 'Unknown',
    time: '${news.time ?? '1'}h ago',
    imagePath: news.articleURL ?? '',
    isNetworkImage: true,
  );
}

void toggleBookmark(ArticleData article) {
  final articles = List<ArticleData>.from(bookmarksNotifier.value);
  final id = articleBookmarkId(title: article.title, source: article.source);
  final index = articles.indexWhere(
    (saved) =>
        articleBookmarkId(title: saved.title, source: saved.source) == id,
  );

  if (index == -1) {
    articles.add(article.copyWith(isBookmarked: true));
  } else {
    articles.removeAt(index);
  }

  bookmarksNotifier.value = articles;
}

bool isBookmarked(ArticleData article) {
  final id = articleBookmarkId(title: article.title, source: article.source);
  return bookmarksNotifier.value.any(
    (saved) =>
        articleBookmarkId(title: saved.title, source: saved.source) == id,
  );
}
