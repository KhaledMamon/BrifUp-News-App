
import 'package:brifup_news/Features/Details%20Screen/Presentation/Screens/page_detail_news.dart';
import 'package:flutter/material.dart';

class Trending extends StatefulWidget {
  const Trending({
    super.key,
    required this.articleURL,
    required this.journal,
    required this.journalURL,
    required this.time,
    required this.title,
    required this.newsData,
    this.country,
    this.snippet,
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
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetail(news: widget.newsData),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('${widget.articleURL}'),
            SizedBox(height: 15),
            Text(
              '${widget.country}',
              style: TextStyle(fontSize: 15, color: Colors.blueGrey),
            ),
            Text('${widget.title}', style: TextStyle(fontSize: 30)),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(
                    '${widget.journalURL}',

                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(width: 5),
                Text(
                  '${widget.journal}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromRGBO(78, 75, 102, 1),
                  ),
                ),
                SizedBox(width: 25),
                Icon(
                  Icons.schedule,
                  size: 20,
                  color: Color.fromRGBO(78, 75, 102, 1),
                ),
                SizedBox(width: 5),
                Text(
                  '${widget.time}h ago',
                  style: TextStyle(color: Color.fromRGBO(78, 75, 102, 1)),
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
