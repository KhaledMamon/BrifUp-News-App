import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.fallbackSeed,
  });

  final String? url;
  final double width;
  final double height;
  final BoxFit fit;
  final String? fallbackSeed;

  static const _fallbackAssets = [
    'images/Background.png',
    'images/Background2.png',
    'images/background3.png',
    'images/Background4.png',
  ];

  String get _fallbackAsset {
    final seed = fallbackSeed ?? url ?? '';
    final index = seed.hashCode.abs() % _fallbackAssets.length;
    return _fallbackAssets[index];
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = url?.trim() ?? '';
    if (imageUrl.isEmpty || !imageUrl.startsWith('http')) {
      return _staticImage();
    }

    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => _staticImage(),
    );
  }

  Widget _staticImage() {
    return Image.asset(_fallbackAsset, width: width, height: height, fit: fit);
  }
}
