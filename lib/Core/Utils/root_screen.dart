import 'package:brifup_news/Features/Bookmark/presentation/screen/bookmarks_screen.dart';
import 'package:brifup_news/Features/Explore/presentation/screen/explore_screen.dart';
import 'package:brifup_news/Features/Home/Presentation/Screen/home.dart';
import 'package:brifup_news/Features/Profile/presentaion/screen/profile_screen.dart';
import 'package:brifup_news/Core/Utils/app_localizations.dart';
import 'package:brifup_news/Core/Utils/app_shell.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    super.initState();
    selectedTabNotifier.addListener(_syncSelectedTab);
  }

  @override
  void dispose() {
    selectedTabNotifier.removeListener(_syncSelectedTab);
    super.dispose();
  }

  void _syncSelectedTab() {
    if (mounted && _currentIndex != selectedTabNotifier.value) {
      setState(() => _currentIndex = selectedTabNotifier.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentIndex]
            .currentState!
            .maybePop();
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            // _buildOffstageNavigator(0, const Splash()),
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
            selectedTabNotifier.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: strings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: strings.explore,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: strings.bookmarks,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: strings.profile,
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
          return MaterialPageRoute(builder: (context) => rootWidget);
        },
      ),
    );
  }
}
