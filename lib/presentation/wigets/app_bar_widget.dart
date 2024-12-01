import 'package:barbershop/presentation/common/style.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String location, name;
  final Widget? trailing;

  const AppBarWidget({
    super.key,
    required this.location,
    required this.name,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Positioned(left: 16, top: 16, bottom: 16, child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on, color: Color(0xFF6B7280), size: 16),
                  Text(location, style: CommonStyle.textStyle14(const Color(0xFF6B7280))),
                ],
              ),
              Text(name, style: CommonStyle.textStyle16Bold()),
            ],
          )),
          if (trailing != null) Positioned(right: 16, top: 16, bottom: 16, child: trailing!),
        ],
      ),
    );
  }
}