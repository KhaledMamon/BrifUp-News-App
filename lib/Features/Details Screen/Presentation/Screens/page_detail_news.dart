import 'package:brifup_news/Features/Home/Data/models/model.dart';
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

      bottomNavigationBar: BottomAppBar(
        height: 70,
        child: Container(
          height: 50,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 232, 43, 26),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Read Full Article on Website ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Icon(Icons.open_in_new_outlined, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      '${widget.news.articleURL}',
                      fit: BoxFit.cover,
                      height: 400,
                    ),
                  ),
                  SizedBox(height: 15),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: 2,
                        bottom: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(209, 255, 255, 255),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        '${widget.news.country}',
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
                      '${widget.news.title}',
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
                          child: Image.network(
                            '${widget.news.journalURL}',

                            width: 25,
                            height: 25,
                            fit: BoxFit.cover,
                          ),
                        ),

                        SizedBox(width: 5),
                        Text(
                          '${widget.news.journal}',
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
                          '${widget.news.time}h ago',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                widget.news.snippet ?? 'No description',
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
