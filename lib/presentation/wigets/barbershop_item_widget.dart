import 'package:barbershop/presentation/common/image.dart';
import 'package:barbershop/presentation/common/style.dart';
import 'package:flutter/material.dart';

class BarberShopItemWidget extends StatelessWidget {
  final String name;
  final String location;
  final String rating;
  final String imagePath;
  final bool isFirst;

  const BarberShopItemWidget({
    Key? key,
    required this.name,
    required this.location,
    required this.rating,
    required this.imagePath,
    required this.isFirst,
  }) : super(key: key);

  Widget _buildPropertyRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF6B7280)),
        const SizedBox(width: 8),
        Text(text, style: CommonStyle.textStyle14(const Color(0xFF6B7280))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        child: isFirst
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonImage(image: imagePath, width: 340, height: 240),
            const SizedBox(height: 12),
            Text(name, style: CommonStyle.textStyle16Bold()),
            const SizedBox(height: 4),
            _buildPropertyRow(Icons.location_on, location),
            _buildPropertyRow(Icons.star, rating),
          ],
        )
            : Row(
          children: [
            CommonImage(image: imagePath, width: 100, height: 100),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: CommonStyle.textStyle16Bold()),
                  const SizedBox(height: 4),
                  _buildPropertyRow(Icons.location_on, location),
                  _buildPropertyRow(Icons.star, rating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
