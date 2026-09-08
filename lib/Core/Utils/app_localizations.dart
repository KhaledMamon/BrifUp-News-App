import 'package:flutter/widgets.dart';

class AppLocalizations {
  const AppLocalizations(this.locale);

  final Locale locale;

  bool get isArabic => locale.languageCode == 'ar';

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations(Localizations.localeOf(context));
  }

  String text(String english, String arabic) => isArabic ? arabic : english;

  String get home => text('Home', 'الرئيسية');
  String get explore => text('Explore', 'استكشاف');
  String get bookmarks => text('Bookmarks', 'المحفوظات');
  String get profile => text('Profile', 'الملف الشخصي');
  String get newsDetails => text('News Details', 'تفاصيل الخبر');
  String get settings => text('Settings', 'الإعدادات');
  String get darkMode => text('Dark Mode', 'الوضع الداكن');
  String get language => text('Language', 'اللغة');
  String get english => text('English', 'الإنجليزية');
  String get arabic => text('Arabic', 'العربية');
  String get notifications => text('Notifications', 'الإشعارات');
  String get readingMode => text('Theme Mode', 'الثيم');
  String get savedArticles => text('Bookmarks', 'المحفوظات');
  String get interests => text('Interests', 'الاهتمامات');
  String get signOut => text('Sign Out', 'تسجيل الخروج');
  String get manageAlerts => text(
    'Manage alerts and daily digests',
    'إدارة التنبيهات والملخصات اليومية',
  );
  String get dark => text('Dark', 'داكن');
  String get light => text('Light', 'فاتح');
  String get savedArticlesSubtitle =>
      text('Read later and offline content', 'اقرأ لاحقًا والمحتوى دون اتصال');
  String get customizeFeed =>
      text('Customize your news feed', 'خصص موجز الأخبار الخاص بك');
}
