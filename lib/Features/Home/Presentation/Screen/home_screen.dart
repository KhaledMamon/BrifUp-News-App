
import 'package:brifup_news/Features/Home/Data/models/model.dart';
import 'package:brifup_news/Features/Home/Presentation/widgets/latest.dart';
import 'package:brifup_news/Features/Home/Presentation/widgets/trend.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this._news,
  });

  final Future<List<NewsModel>> _news;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (value) {
              // print("onSubmitted: $value");
            },
            keyboardType: TextInputType.text,
    
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search",
    
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Color(0xFF4A4A6A),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Color(0xFF4A4A6A),
                  width: 2.0,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.tune),
              ),
    
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
    
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text(
                'Trending',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 17,
                    color: const Color.fromARGB(255, 232, 43, 26),
                  ),
                ),
              ),
            ],
          ),
        ),
    
        Trend(news: _news),
    
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Row(
            children: [
              const Text(
                'Latest',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 17,
                    color: const Color.fromARGB(255, 232, 43, 26),
                  ),
                ),
              ),
            ],
          ),
        ),
        DefaultTabController(
          length: 7,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: const Color.fromARGB(255, 232, 43, 26),
                labelColor: const Color.fromARGB(255, 232, 43, 26),
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: "All"),
                  Tab(text: "Sports"),
                  Tab(text: "Politics"),
                  Tab(text: "Business"),
                  Tab(text: "Health"),
                  Tab(text: "Travel"),
                  Tab(text: "Science"),
                ],
              ),
            ],
          ),
        ),
        Latest(news: _news),
      ],
    );
  }
}
