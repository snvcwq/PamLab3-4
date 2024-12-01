import 'package:flutter/material.dart';

class CommonImage extends StatelessWidget {
  final String image;
  final double width, height;
  final BoxFit fit;
  const CommonImage({super.key, required this.image, this.width = 40, this.height = 40, this.fit = BoxFit.cover});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset(image, width: width, height: height, fit: fit));
  }
}