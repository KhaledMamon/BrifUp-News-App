import 'package:brifup_news/Features/bookmark/Data/model/article_model.dart';
import 'package:brifup_news/Features/bookmark/presentation/wediget/bookmark_card.dart';
import 'package:brifup_news/Features/bookmark/presentation/wediget/bookmarks_header.dart';
import 'package:flutter/material.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  int _currentIndex = 2;

  final List<ArticleData> articles = [
    const ArticleData(
      category: 'Technology',
      title: 'AI is changing the concept of architectural design in the...',
      source: 'Al Jazeera',
      time: '2h ago',
      imagePath: 'images/Background.png',
    ),
    const ArticleData(
      category: 'Economy',
      title: 'Gulf markets close higher supported by energy stocks',
      source: 'Al-Eqtisadiah',
      time: '5h ago',
      imagePath: 'images/Background2.png',
    ),
    const ArticleData(
      category: 'Sports',
      title: "Comprehensive analysis: Reasons for the team's...",
      source: 'beIN SPORTS',
      time: 'Yesterday',
      imagePath: 'images/background3.png',
    ),
    const ArticleData(
      category: 'Culture',
      title: 'International Book Fair opens its doors with the...',
      source: 'Al Arabiya',
      time: '2 days ago',
      imagePath: 'images/Background4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Bookmarks',
          style: TextStyle(
            color: Color(0xFFD71920),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFFD71920)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            BookmarksHeader(
              articlesCount: articles.length,
              onFilterPressed: () {},
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: articles.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return BookmarkCard(
                    article: articles[index],
                    onBookmarkPressed: () {
                      setState(() {
                        articles.removeAt(index);
                      });
                    },
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFD71920),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmarks'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}