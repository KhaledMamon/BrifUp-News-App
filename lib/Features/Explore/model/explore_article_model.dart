class ExploreArticleModel {
  final String? category;
  final String title;
  final String? description;
  final String? publishedAt;
  final String? urlToImage;
  final String? url; // ضفنا الـ URL عشان لو حابب تفتح الخبر كاملاً

  const ExploreArticleModel({
    this.category,
    required this.title,
    this.description,
    this.publishedAt,
    this.urlToImage,
    this.url,
  });

  // Factory لتحويل الـ JSON اللي جاي من Dio لـ Model
  factory ExploreArticleModel.fromJson(Map<String, dynamic> json, {String? categoryName}) {
    return ExploreArticleModel(
      category: categoryName,
      title: json['title'] ?? 'بدون عنوان',
      description: json['description'] ?? '',
      publishedAt: json['publishedAt'],
      urlToImage: json['urlToImage'],
      url: json['url'],
    );
  }
}