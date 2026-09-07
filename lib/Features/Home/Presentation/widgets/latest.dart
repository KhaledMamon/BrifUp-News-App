import 'package:brifup_news/Features/Home/Data/models/model.dart';
import 'package:brifup_news/Features/Home/Presentation/widgets/latest_news.dart';
import 'package:flutter/material.dart';

class Latest extends StatelessWidget {
  const Latest({
    super.key,
    required this.news,
  });

  final Future<List<NewsModel>> news;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: news,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 232, 43, 26),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Something went wrong: ${snapshot.error}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final allNews = snapshot.data!;
          return ListView.builder(
            itemCount: allNews.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final newsItem = allNews[index];
              return LatestNews(
                articleURL: newsItem.articleURL ?? '',
                country: newsItem.country ?? 'US',
                journal: newsItem.journal ?? 'Unknown',
                journalURL: newsItem.journalURL ?? '',
                time: newsItem.time ?? '1',
                title: newsItem.title ?? '',
                snippet: newsItem.snippet ?? '',
                newsData: newsItem,
              );
            },
          );
        }

        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'No news available at the moment.',
              style: TextStyle(color: Colors.grey),
      ),
        ),
      );
    },
  );
}
}
    
  
