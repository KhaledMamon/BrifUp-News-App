import 'package:brifup_news/Features/Home/Data/models/model.dart';
import 'package:brifup_news/Features/Home/Presentation/widgets/trending.dart';
import 'package:flutter/material.dart';

class Trend extends StatelessWidget {
  const Trend({
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
          final news = snapshot.data![0];
          return SizedBox(
            height: 400,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Trending(
                  articleURL: news.journal ?? '',
                  country: news.country ?? 'US',
                  journal: news.journal ?? 'Unknown',
                  journalURL: news.journalURL ?? '',
                  time: news.time ?? '6',
                  title: news.title ?? '',
                  snippet: news.snippet ?? '',
                  newsData: news,
                ),
                Trending(
                  articleURL: news.articleURL ?? '',
                  country: news.country ?? 'US',
                  journal: news.journal ?? 'Unknown',
                  journalURL: news.journalURL ?? '',
                  time: news.time ?? '6',
                  title: news.title ?? '',
                  snippet: news.snippet ?? '',
                  newsData: news,
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
