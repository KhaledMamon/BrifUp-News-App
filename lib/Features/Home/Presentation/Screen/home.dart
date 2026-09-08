import 'dart:convert';
import 'package:brifup_news/Features/Home/Presentation/Screen/home_screen.dart';
import 'package:brifup_news/Core/Utils/app_localizations.dart';
import 'package:brifup_news/Core/Utils/app_shell.dart';
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
  // int _currentIndex = 0;

  late Future<List<NewsModel>> _news;
  @override
  void initState() {
    super.initState();
    _news = fetchNews();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     appBar: AppHeader(title: AppLocalizations.of(context).home),

      drawer: const AppDrawer(),

      body: Home(news: _news),
    );
  }
}
