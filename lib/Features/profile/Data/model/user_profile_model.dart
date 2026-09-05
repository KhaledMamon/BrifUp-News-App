class UserProfileModel {
  final String name;
  final String email;
  final String imagePath;
  final bool isDarkMode;

  const UserProfileModel({
    required this.name,
    required this.email,
    required this.imagePath,
    required this.isDarkMode,
  });
}