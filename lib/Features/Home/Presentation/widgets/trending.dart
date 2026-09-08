import 'package:brifup_news/Features/Details%20Screen/Presentation/Screens/page_detail_news.dart';
import 'package:brifup_news/Core/Utils/app_image.dart';
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
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: AppImage(
                url: widget.articleURL,
                width: 370,
                height: double.infinity,
                fit: BoxFit.cover,
                fallbackSeed: widget.title,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(209, 255, 255, 255),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  '${widget.country}',
                  style: TextStyle(
                    fontSize: 25,
                    color: const Color.fromARGB(255, 232, 43, 26),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Text(
                '${widget.title}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 20,
              right: 0,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: AppImage(
                      url: widget.journalURL,
                      width: 25,
                      height: 25,
                      fit: BoxFit.cover,
                      fallbackSeed: widget.journal,
                    ),
                  ),

                  SizedBox(width: 5),
                  Text(
                    '${widget.journal}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 25),
                  Icon(Icons.schedule, size: 20, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    '${widget.time}h ago',
                    style: TextStyle(color: Colors.grey),
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
