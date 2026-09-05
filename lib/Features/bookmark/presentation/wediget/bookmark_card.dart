import 'package:brifup_news/Features/bookmark/Data/model/article_model.dart';
import 'package:flutter/material.dart';



class BookmarkCard extends StatelessWidget {
  final ArticleData article;
  final VoidCallback onBookmarkPressed;
  final VoidCallback onTap;

  const BookmarkCard({
    super.key,
    required this.article,
    required this.onBookmarkPressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 95,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFE2E2E2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _CategoryChip(title: article.category),
                      const Spacer(),
                      GestureDetector(
                        onTap: onBookmarkPressed,
                        child: const Icon(
                          Icons.bookmark,
                          color: Color(0xFFD71920),
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF202020),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        article.source,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF555555),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          '•',
                          style: TextStyle(fontSize: 10, color: Color(0xFF999999)),
                        ),
                      ),
                      Text(
                        article.time,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF555555),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                article.imagePath,
                width: 80,
                height: 75,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    width: 80,
                    height: 75,
                    color: const Color(0xFFEAEAEA),
                    child: const Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String title;

  const _CategoryChip({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 9,
          color: Color(0xFF555555),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}