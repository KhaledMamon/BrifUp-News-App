import 'package:flutter/material.dart';
import 'package:brifup_news/Core/Utils/app_localizations.dart';
import 'package:brifup_news/Core/Utils/app_shell.dart';
import 'package:brifup_news/main.dart';
import '../../Data/model/user_profile_model.dart';
import '../wediget/profile_menu_item.dart';
import '../wediget/profile_switch_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserProfileModel user = const UserProfileModel(
    name: "Mohamed Elmasry",
    email: "moham.doe@example.com",
    imagePath: "images/mohamed naser.jpeg",
    isDarkMode: true,
  );

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: const AppDrawer(),
      appBar: AppHeader(title: strings.profile),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(user.imagePath),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.red,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.edit,
                          size: 14,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              user.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              user.email,
              style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.notifications_none,
                    title: strings.notifications,
                    subtitle: strings.manageAlerts,
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 60),
                  ProfileSwitchItem(
                    icon: Icons.dark_mode_outlined,
                    title: strings.readingMode,
                    subtitle: themeNotifier.value == ThemeMode.dark
                        ? strings.dark
                        : strings.light,
                    value: themeNotifier.value == ThemeMode.dark,
                    onChanged: (val) {
                      themeNotifier.value = val
                          ? ThemeMode.dark
                          : ThemeMode.light;
                    },
                  ),
                  const Divider(height: 1, indent: 60),
                  ProfileMenuItem(
                    icon: Icons.bookmark_border,
                    title: strings.savedArticles,
                    subtitle: strings.savedArticlesSubtitle,
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 60),
                  ProfileMenuItem(
                    icon: Icons.auto_awesome_mosaic_outlined,
                    title: strings.interests,
                    subtitle: strings.customizeFeed,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red, width: 1),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.logout, size: 20),
                  SizedBox(width: 8),
                  Text(
                    strings.signOut,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
