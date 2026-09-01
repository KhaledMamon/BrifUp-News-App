
import 'package:brifup_news/page_detail_news.dart';
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
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetail(news: widget.newsData),
          ),
        );
      },
      child: Card(
        child: Row(
          children: [
            Image.network(
              '${widget.articleURL}',
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: 120,
                    ),
                  ),
                );
              },
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.country}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(78, 75, 102, 1),
                    ),
                  ),

                  Text(
                    '${widget.title}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                          '${widget.journalURL}',
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        // '${widget.journal}',
                        (widget.journal!.length > 10)
                            ? '${widget.journal!.substring(0, 10)}..'
                            : widget.journal!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromRGBO(78, 75, 102, 1),
                        ),
                      ),
                      SizedBox(width: 25),
                      Icon(
                        Icons.schedule,
                        size: 17,
                        color: Color.fromRGBO(78, 75, 102, 1),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${widget.time}h ago',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(78, 75, 102, 1),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        // alignment: Alignment.bottomLeft,
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          size: 20,
                          color: Color.fromRGBO(78, 75, 102, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
