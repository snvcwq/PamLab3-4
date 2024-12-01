import 'package:barbershop/domain/entities/main_banner.dart';
import 'package:barbershop/presentation/common/style.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final MainBanner banner;

  const BannerWidget({super.key, required this.banner});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                banner.image,
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(54, 48, 98, 1),
              ),
              child:
              Text(banner.buttonTitle, style: CommonStyle.textStyle14(const Color(0xFFFFFFFF))),
            ),
          ),
        ],
      ),
    );
  }
}
