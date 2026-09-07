import 'package:brifup_news/Features/Home/Data/models/model.dart';
import 'package:brifup_news/Features/Home/Presentation/widgets/latest_news.dart';
import 'package:flutter/material.dart';

class Latest extends StatelessWidget {
  const Latest({
    super.key,
    required this._news,
  });

  final Future<List<NewsModel>> _news;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: _news,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final allNews = snapshot.data!;
          return ListView.builder(
            itemCount: allNews.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final news = allNews[index];
              return LatestNews(
                articleURL: news.articleURL ?? '',
                country: news.country ?? 'US',
                journal: news.journal ?? 'Unknown',
                journalURL: news.journalURL ?? '',
                time: news.time ?? '6',
                title: news.title ?? '',
                snippet: news.snippet ?? '',
                newsData: news,
              );
            },
          );
        }
        return Container();
      },
    );
  }
}

