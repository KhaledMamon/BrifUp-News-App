
import 'dart:io';

import 'package:brifup_news/Features/bookmark/presentation/screen/bookmarks_screen.dart';
import 'package:brifup_news/splash.dart';
import 'package:flutter/material.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);


void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, currentMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: const BookmarksScreen(),
        );
      },
    );
  }
}
