import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final String imagePath;

  ImageViewer({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 1.0,
      maxScale: 5.0,
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}
