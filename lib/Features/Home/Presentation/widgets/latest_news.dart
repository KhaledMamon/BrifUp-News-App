import 'package:brifup_news/Features/Details%20Screen/Presentation/Screens/page_detail_news.dart';
import 'package:brifup_news/Features/Bookmark/Data/bookmark_store.dart';
import 'package:brifup_news/Features/Bookmark/Data/model/article_model.dart';
import 'package:brifup_news/Features/Home/Data/models/model.dart';
import 'package:brifup_news/Core/Utils/app_image.dart';
import 'package:flutter/material.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({
    super.key,
    required this.articleURL,
    this.country,
    required this.journal,
    required this.journalURL,
    required this.time,
    required this.title,
    this.snippet,
    required this.newsData,
  });

  final String? articleURL;
  final String? country;
  final String? title;
  final String? journalURL;
  final String? journal;
  final String? time;
  final String? snippet;
  final dynamic newsData;

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetail(news: widget.newsData),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AppImage(
                  url: widget.articleURL,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  fallbackSeed: widget.title,
                ),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.country ?? '',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(78, 75, 102, 1),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.title ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AppImage(
                            url: widget.journalURL,
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                            fallbackSeed: widget.journal,
                          ),
                        ),
                        const SizedBox(width: 4),

                        Flexible(
                          child: Text(
                            widget.journal ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color.fromRGBO(78, 75, 102, 1),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),

                        const Icon(
                          Icons.schedule,
                          size: 14,
                          color: Color.fromRGBO(78, 75, 102, 1),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${widget.time ?? "0"}h ago',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(78, 75, 102, 1),
                          ),
                        ),

                        const Spacer(flex: 1),

                        ValueListenableBuilder<List<ArticleData>>(
                          valueListenable: bookmarksNotifier,
                          builder: (context, bookmarks, child) {
                            final article = articleDataFromNews(
                              NewsModel(
                                articleURL: widget.articleURL,
                                title: widget.title,
                                journal: widget.journal,
                                journalURL: widget.journalURL,
                                country: widget.country,
                                time: widget.time,
                                snippet: widget.snippet,
                              ),
                            );
                            final saved = bookmarks.any(
                              (item) =>
                                  articleBookmarkId(
                                    title: item.title,
                                    source: item.source,
                                  ) ==
                                  articleBookmarkId(
                                    title: article.title,
                                    source: article.source,
                                  ),
                            );

                            return GestureDetector(
                              onTap: () => toggleBookmark(article),
                              child: Icon(
                                saved
                                    ? Icons.bookmark
                                    : Icons.bookmark_border_outlined,
                                size: 20,
                                color: saved
                                    ? const Color(0xFFD71920)
                                    : const Color.fromRGBO(78, 75, 102, 1),
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
        ),
      ),
    );
  }
}
