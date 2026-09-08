import 'package:brifup_news/Features/Home/Data/models/model.dart';
import 'package:brifup_news/Core/Utils/app_image.dart';
import 'package:brifup_news/Core/Utils/app_localizations.dart';
import 'package:brifup_news/Core/Utils/app_shell.dart';
import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget {
  final NewsModel news;

  const NewsDetail({super.key, required this.news});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  Future<void> _launchURL(String? urlString) async {
    if (urlString == null || urlString.isEmpty) return;
    final Uri url = Uri.parse(urlString);
    // if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    //   if (mounted) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(content: Text('Could not open the link')),
    //     );
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: AppLocalizations.of(context).newsDetails,
        showBack: true,
      ),
      drawer: const AppDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AppImage(
                      url: widget.news.articleURL,
                      fit: BoxFit.cover,
                      height: 350,
                      width: double.infinity,
                      fallbackSeed: widget.news.title,
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.news.country ?? 'US',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 232, 43, 26),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 12,
                    left: 12,
                    right: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.news.title ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: AppImage(
                                url: widget.news.journalURL,
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                                fallbackSeed: widget.news.journal,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              widget.news.journal ?? 'Unknown',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Icon(
                              Icons.schedule,
                              size: 16,
                              color: Colors.white70,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.news.time ?? "0"}h ago',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Text(
                widget.news.snippet ?? 'No details available.',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _launchURL(widget.news.articleURL),
                  icon: const Icon(Icons.open_in_new_outlined),
                  label: const Text('Read Full Article on Website'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
