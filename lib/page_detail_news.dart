
import 'package:brifup_news/model.dart';
import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget {
  final NewsModel news;

  const NewsDetail({super.key, required this.news});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BriefUp News',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          TextButton(onPressed: () {}, child: Icon(Icons.more_vert, size: 25)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // News Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  '${widget.news.articleURL}',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      color: const Color.fromARGB(255, 78, 76, 76),
                      child: Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 80,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Country
              Text(
                '${widget.news.country ?? 'US'}',
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
              SizedBox(height: 8),

              // Title
              Text(
                '${widget.news.title}',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              // Row with journal info and time
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      '${widget.news.journalURL}',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: Icon(Icons.newspaper, size: 16),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${widget.news.journal}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromRGBO(78, 75, 102, 1),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 16),
                  Icon(
                    Icons.schedule,
                    size: 20,
                    color: Color.fromRGBO(78, 75, 102, 1),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${widget.news.time ?? '0'}h ago',
                    style: TextStyle(color: Color.fromRGBO(78, 75, 102, 1)),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Snippet / Description
              Text(
                '${widget.news.snippet ?? 'No description available'}',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
