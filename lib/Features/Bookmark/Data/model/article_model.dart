class ArticleData {
  final String category;
  final String title;
  final String source;
  final String time;
  final String imagePath;
  final bool isBookmarked;
  final bool isNetworkImage;

  const ArticleData({
    required this.category,
    required this.title,
    required this.source,
    required this.time,
    required this.imagePath,
    this.isBookmarked = true,
    this.isNetworkImage = false,
  });

  ArticleData copyWith({bool? isBookmarked}) {
    return ArticleData(
      category: category,
      title: title,
      source: source,
      time: time,
      imagePath: imagePath,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      isNetworkImage: isNetworkImage,
    );
  }
}
