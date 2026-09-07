import 'package:brifup_news/Features/Bookmark/presentation/screen/bookmarks_screen.dart';
import 'package:brifup_news/Features/Explore/presentation/screen/explore_screen.dart';
import 'package:brifup_news/Features/Home/Presentation/Screen/home.dart';
import 'package:brifup_news/Features/Profile/presentaion/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  // استخدام GlobalKeys للحفاظ على حالة الـ Navigator لكل tab مستقلة
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // دعم زر الرجوع داخل الـ Tab الحالية دون الخروج فوراً من التطبيق
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentIndex].currentState!.maybePop();
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            _buildOffstageNavigator(0, const HomeScreen()),
            _buildOffstageNavigator(1, const ExploreScreen()),
            _buildOffstageNavigator(2, const BookmarksScreen()),
            _buildOffstageNavigator(3, const ProfileScreen()),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 232, 43, 26),
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Bookmarks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(int index, Widget rootWidget) {
    return Offstage(
      offstage: _currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => rootWidget,
          );
        },
      ),
    );
  }
}