import 'dart:convert';
import 'package:brifup_news/Features/Home/Data/models/model.dart';
import 'package:http/http.dart' as http;


class HomeApiService {
  final String _apiKey = '53eeb69150714146a59d84809e266edd';
  final String _baseUrl = 'https://newsapi.org/v2';

  // لجلب الأخبار الأكثر تداولاً (Trending)
  Future<List<NewsModel>> getTrendingNews() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/top-headlines?country=us&pageSize=5&apiKey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List articles = data['articles'];
      return articles.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load trending news');
    }
  }

  // لجلب أحدث الأخبار (Latest News)
  Future<List<NewsModel>> getLatestNews() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/everything?q=general&sortBy=publishedAt&pageSize=10&apiKey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List articles = data['articles'];
      return articles.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load latest news');
    }
  }
}