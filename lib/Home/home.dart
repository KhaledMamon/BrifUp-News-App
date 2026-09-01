import 'dart:convert';
import 'package:brifup_news/main.dart';
import 'package:brifup_news/model.dart';
import 'package:brifup_news/Home/widgets/latest_news.dart';
import 'package:brifup_news/Home/widgets/trending.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<List<NewsModel>> fetchNews() async {
  final url = Uri.parse(
    'https://real-time-news-data.p.rapidapi.com/top-headlines?limit=500&country=US&lang=en',
  );

  final headers = {
    'x-rapidapi-key': '6b0fb2c0bfmsh1838525fff97fc9p19ec8djsn3f8b47ba1f24',
    'x-rapidapi-host': 'real-time-news-data.p.rapidapi.com',
    'Content-Type': 'application/json',
  };

  try {
    final response = await http
        .get(url, headers: headers)
        .timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data.containsKey('data')) {
        List items = data['data'];
        return items.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load news');
    }
  } catch (error) {
    // print('Error occurred: $error');
    return [];
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  late Future<List<NewsModel>> _news;
  @override
  void initState() {
    super.initState();
    _news = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.newspaper_sharp, size: 35),
          color: const Color.fromARGB(255, 232, 43, 26),
          onPressed: () {},
        ),
        title: Text(
          'BriefUp',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),

            onPressed: () {
              setState(() {
                themeNotifier.value = themeNotifier.value == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, size: 35),
            onPressed: () {},
          ),
        ],
      ),
      key: scaffoldKey,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 232, 43, 26),
        items: [
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 1 ? Icons.explore : Icons.explore_outlined,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 2 ? Icons.bookmark : Icons.bookmark_outline,
            ),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 3 ? Icons.person : Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: ListView(
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
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),

          FutureBuilder<List<NewsModel>>(
            future: _news,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                final news = snapshot.data![0];
                return Trending(
                  articleURL: news.articleURL ?? '',
                  country: news.country ?? 'US',
                  journal: news.journal ?? 'Unknown',
                  journalURL: news.journalURL ?? '',
                  time: news.time ?? '5',
                  title: news.title ?? '',
                  snippet: news.snippet ?? '',
                  newsData: news,
                );
              }
              return Container();
            },
          ),

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
                    style: TextStyle(fontSize: 17, color: Colors.grey),
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
                  labelColor: Colors.black,
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
          FutureBuilder<List<NewsModel>>(
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
          ),
        ],
      ),
    );
  }
}
