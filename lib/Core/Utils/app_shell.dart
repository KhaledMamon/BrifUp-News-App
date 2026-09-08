import 'package:brifup_news/Core/Utils/app_localizations.dart';
import 'package:brifup_news/main.dart';
import 'package:flutter/material.dart';

final ValueNotifier<int> selectedTabNotifier = ValueNotifier<int>(0);

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key, required this.title, this.showBack = false});

  final String title;
  final bool showBack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFFE82B1A),
        ),
      ),
      centerTitle: true,
      leadingWidth: showBack ? 104 : 56,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showBack)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).maybePop(),
            ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            themeNotifier.value == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
          onPressed: () {
            themeNotifier.value = themeNotifier.value == ThemeMode.light
                ? ThemeMode.dark
                : ThemeMode.light;
          },
        ),
      ],
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _selectTab(BuildContext context, int index) {
    selectedTabNotifier.value = index;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 40),
          const CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xFFE82B1A),
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Text(
            'Khaled Gamal',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Text(
            'Khaledgamal.boy@gmail.com',
            style: TextStyle(fontSize: 13),
          ),
          const Divider(height: 32),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(strings.home),
            onTap: () => _selectTab(context, 0),
          ),
          ListTile(
            leading: const Icon(Icons.explore),
            title: Text(strings.explore),
            onTap: () => _selectTab(context, 1),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: Text(strings.bookmarks),
            onTap: () => _selectTab(context, 2),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(strings.profile),
            onTap: () => _selectTab(context, 3),
          ),
          const Divider(height: 32),
          Text(
            strings.settings,
            style: const TextStyle(
              color: Color(0xFFE82B1A),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (context, mode, child) => SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(strings.darkMode),
              value: mode == ThemeMode.dark,
              onChanged: (value) {
                themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
              },
            ),
          ),
          ValueListenableBuilder<Locale>(
            valueListenable: localeNotifier,
            builder: (context, locale, child) =>
                DropdownButtonFormField<String>(
                  initialValue: locale.languageCode == 'ar' ? 'ar' : 'en',
                  decoration: InputDecoration(labelText: strings.language),
                  items: [
                    DropdownMenuItem(value: 'en', child: Text(strings.english)),
                    DropdownMenuItem(value: 'ar', child: Text(strings.arabic)),
                  ],
                  onChanged: (value) {
                    if (value != null) localeNotifier.value = Locale(value);
                  },
                ),
          ),
        ],
      ),
    );
  }
}
