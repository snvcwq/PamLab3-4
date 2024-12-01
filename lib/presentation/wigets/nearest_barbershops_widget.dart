import 'package:barbershop/domain/entities/nearest_barbershop.dart';
import 'package:barbershop/presentation/common/style.dart';
import 'package:barbershop/presentation/wigets/barbershop_item_widget.dart';
import 'package:flutter/material.dart';

class NearestBarbershopWidget extends StatefulWidget {
  final List<NearestBarbershop> barbershops;

  const NearestBarbershopWidget({super.key, required this.barbershops});

  @override
  _NearestBarbershopWidgetState createState() => _NearestBarbershopWidgetState();
}

class _NearestBarbershopWidgetState extends State<NearestBarbershopWidget> {
  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    // Determine how many items to show based on _showAll
    int itemCount = _showAll ? widget.barbershops.length : (widget.barbershops.length > 4 ? 4 : widget.barbershops.length);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nearest Barbershops', style: CommonStyle.textStyle18Bold()),
        const SizedBox(height: 12),

        // Display the list of barbershops, based on whether _showAll is true or false
        SizedBox(
          height: _showAll ? null : 280, // Adjust the height based on the items
          child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return BarberShopItemWidget(
                name: widget.barbershops[index].name,
                location: widget.barbershops[index].locationWithDistance,
                rating: widget.barbershops[index].reviewRate.toString(),
                imagePath: widget.barbershops[index].image,
                isFirst: false,
              );
            },
          ),
        ),

        // If there are more items, show the "See All" button
        if (widget.barbershops.length > 4) ...[
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showAll = !_showAll; // Toggle between showing all or limited items
              });
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Color(0xFF36362E), width: 1),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _showAll ? 'Show Less' : 'See All',
                  style: CommonStyle.textStyle16Bold().copyWith(color: const Color(0xFF363032)),
                ),
                const SizedBox(width: 8),
                Image.asset('images/arrow-up.png', width: 16, height: 16),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
