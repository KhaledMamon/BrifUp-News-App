import 'package:dio/dio.dart';
import '../model/explore_article_model.dart';

class NewsApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final String _apiKey = '53eeb69150714146a59d84809e266edd';

  Future<List<ExploreArticleModel>> getArticlesByCategory(String category) async {
    try {
      final response = await _dio.get(
        'top-headlines',
        queryParameters: {
          'country': 'us',
          'category': category.toLowerCase(),
          'apiKey': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        List articlesJson = response.data['articles'] ?? [];
        
        print("Success: Fetched ${articlesJson.length} articles for $category");

        return articlesJson
            .map((json) => ExploreArticleModel.fromJson(json, categoryName: category))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      print('Dio Error Status: ${e.response?.statusCode}');
      print('Dio Error Response: ${e.response?.data}');
      return [];
    } catch (e) {
      print('General Error: $e');
      return [];
    }
  }
}