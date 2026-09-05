import 'package:flutter/material.dart';
import '../../Data/model/user_profile_model.dart';
import '../wediget/profile_menu_item.dart';
import '../wediget/profile_switch_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;


  final UserProfileModel user = const UserProfileModel(
    name: "Mohamed Elmasry",
    email: "moham.doe@example.com",
    imagePath: "images/mohamed naser.jpeg",
    isDarkMode: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "BrifUp News",
          style: TextStyle(
            color: Color(0xFFB71C1C),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
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
                        icon: const Icon(Icons.edit, size: 14, color: Colors.white),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.notifications_none,
                    title: "Notifications",
                    subtitle: "Manage alerts and daily digests",
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 60),
                  ProfileSwitchItem(
                    icon: Icons.dark_mode_outlined,
                    title: "Reading Mode",
                    subtitle: isDarkMode ? "Dark" : "Light",
                    value: isDarkMode,
                    onChanged: (val) {
                      setState(() {
                        isDarkMode = val;
                      });
                    },
                  ),
                  const Divider(height: 1, indent: 60),
                  ProfileMenuItem(
                    icon: Icons.bookmark_border,
                    title: "Saved Articles",
                    subtitle: "Read later and offline content",
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 60),
                  ProfileMenuItem(
                    icon: Icons.auto_awesome_mosaic_outlined,
                    title: "Interests",
                    subtitle: "Customize your news feed",
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
                children: const [
                  Icon(Icons.logout, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Sign Out",
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