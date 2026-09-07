import 'dart:convert';
import 'package:brifup_news/Features/Explore/presentation/screen/explore_screen.dart';
import 'package:brifup_news/Features/Home/Presentation/Screen/home_screen.dart';
import 'package:brifup_news/Features/bookmark/presentation/screen/bookmarks_screen.dart';
import 'package:brifup_news/Features/profile/presentaion/screen/profile_screen.dart';
import 'package:brifup_news/main.dart';
import 'package:brifup_news/Features/Home/Data/models/model.dart';
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
  int _currentIndex = 0;

  // final List<Widget> _pages = const [
  //   HomeScreen(),
  //   ExploreScreen(),
  //   BookmarksScreen(),
  //   ProfileScreen(),
  // ];
  late Future<List<NewsModel>> _news;
  @override
  void initState() {
    super.initState();
    _news = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BriefUp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: const Color.fromARGB(255, 232, 43, 26),
          ),
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

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 232, 43, 26),
                  ),
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Khaled Gamal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Khaledgamal.boy@gmail.com',
                      style: TextStyle(
                        fontSize: 13,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(
              thickness: .5,
              color: Colors.grey,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('Explore'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExploreScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Bookmarks'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookmarksScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Divider(
              thickness: .5,
              color: Colors.grey,
              indent: 20,
              endIndent: 20,
            ),
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 232, 43, 26),
              ),
            ),
            ListTile(
              leading: Text(
                'Dark Mode',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: const Color.fromARGB(255, 232, 43, 26),
                ),
              ),
              title: Switch(
                value: themeNotifier.value == ThemeMode.dark,
                onChanged: (value) {
                  setState(() {
                    themeNotifier.value = value
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  });
                },
              ),
              onTap: () {
                // Handle Settings navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Text(
                'Language',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: const Color.fromARGB(255, 232, 43, 26),
                ),
              ),
              title: DropdownButton<String>(
                value: 'English',
                items: <String>['English', 'Arabic']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })
                    .toList(),
                onChanged: (String? newValue) {
                  // Handle language change
                },
              ),
              onTap: () {
                // Handle Settings navigation
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 232, 43, 26),
        items: [
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 1 ? Icons.explore : Icons.explore_outlined,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 2 ? Icons.bookmark : Icons.bookmark_outline,
            ),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 3 ? Icons.person : Icons.person_outline,
            ),
            label: 'Profile',
          ),
        ],
      ),
      // body: _currentIndex == 0 ? Home() : _pages[_currentIndex],
      body: Home(news: _news),
    );
  }
}
