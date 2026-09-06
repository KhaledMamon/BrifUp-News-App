class NewsModel {
  const NewsModel({
    required this.articleURL,
    required this.title,
    required this.journal,
    required this.journalURL,
    this.country,
    this.time,
    this.snippet,
  });

  final String? articleURL;
  final String? title;
  final String? journal;
  final String? journalURL;
  final String? country;
  final String? time;
  final String? snippet;

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? 'No Title',
      country: json['country'] ?? 'US',
      articleURL: json['photo_url'] ?? 'no image',
      journal: json['source_name'] ?? 'no image',
      journalURL: json['source_favicon_url'] ?? 'no image',
      snippet: json['snippet'] ?? 'No description available',
      // time:json['published_datetime_utc'] ?? '0',
    );
  }
}
