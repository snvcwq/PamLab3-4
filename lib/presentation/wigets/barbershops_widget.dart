
import 'package:barbershop/domain/entities/barbershop.dart';
import 'package:barbershop/presentation/common/style.dart';
import 'package:barbershop/presentation/wigets/barbershop_item_widget.dart';
import 'package:flutter/material.dart';


class AllBarberShopsWidget extends StatelessWidget {
  final List<Barbershop> barbershops;

const AllBarberShopsWidget({super.key, required this.barbershops});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('All', style: CommonStyle.textStyle18Bold()),
        const SizedBox(height: 12),

        Column(
          children: List.generate(barbershops.length, (index) {
            return BarberShopItemWidget(
              name: barbershops[index].name,
              location: barbershops[index].locationWithDistance,
              rating: barbershops[index].reviewRate.toString(),
              imagePath: barbershops[index].image,
              isFirst: index == 0,
            );
          }),
        ),
      ],
    );
  }
}