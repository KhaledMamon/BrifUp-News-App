import 'package:brifup_news/Features/Bookmark/Data/model/article_model.dart';
import 'package:brifup_news/Features/Bookmark/Data/bookmark_store.dart';
import 'package:brifup_news/Features/Bookmark/presentation/wediget/bookmark_card.dart';
import 'package:brifup_news/Features/Bookmark/presentation/wediget/bookmarks_header.dart';
import 'package:flutter/material.dart';
import 'package:brifup_news/Core/Utils/app_shell.dart';
import 'package:brifup_news/Core/Utils/app_localizations.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: AppLocalizations.of(context).bookmarks),
      drawer: const AppDrawer(),
      body: ValueListenableBuilder<List<ArticleData>>(
        valueListenable: bookmarksNotifier,
        builder: (context, articles, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                BookmarksHeader(
                  articlesCount: articles.length,
                  onFilterPressed: () {},
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    itemCount: articles.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return BookmarkCard(
                        article: articles[index],
                        onBookmarkPressed: () =>
                            toggleBookmark(articles[index]),
                        onTap: () {},
                      );
                    },
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
