import 'package:brifup_news/Features/Details%20Screen/Presentation/Screens/page_detail_news.dart';
import 'package:flutter/material.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({
    super.key,
    required this.articleURL,
    this.country,
    required this.journal,
    required this.journalURL,
    required this.time,
    required this.title,
    this.snippet,
    required this.newsData,
  });

  final String? articleURL;
  final String? country;
  final String? title;
  final String? journalURL;
  final String? journal;
  final String? time;
  final String? snippet;
  final dynamic newsData;

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetail(news: widget.newsData),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. الصورة الرئيسية مع معالجة الأخطاء والأبعاد
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.articleURL ?? '',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.grey,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),

              // 2. تفاصيل الخبر
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.country ?? '',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(78, 75, 102, 1),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.title ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8),

                    // 3. الصف السفلي للمصدر والوقت والأيقونة
                    Row(
                      children: [
                        // صورة المصدر
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            widget.journalURL ?? '',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.newspaper,
                              size: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),

                        // اسم المصدر
                        Flexible(
                          child: Text(
                            widget.journal ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color.fromRGBO(78, 75, 102, 1),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),

                        // أيقونة الوقت والزمن
                        const Icon(
                          Icons.schedule,
                          size: 14,
                          color: Color.fromRGBO(78, 75, 102, 1),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${widget.time ?? "0"}h ago',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(78, 75, 102, 1),
                          ),
                        ),

                        const Spacer(),

                        // زر الحفظ
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.bookmark_border_outlined,
                            size: 20,
                            color: Color.fromRGBO(78, 75, 102, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}