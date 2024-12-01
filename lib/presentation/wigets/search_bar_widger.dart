import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final double top, left, width, height;
  final bool enabled;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  const SearchBarWidget({super.key,
    required this.top, required this.left, this.width = 152, this.height = 45, this.enabled = true,
    this.controller, this.onChanged, this.onEditingComplete,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top, left: widget.left, child: Container(
      width: widget.width, height: widget.height,
      decoration: BoxDecoration(color: const Color(0xFFEBF0F5), borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(child: TextField(
            enabled: widget.enabled, controller: widget.controller, onChanged: widget.onChanged, onEditingComplete: widget.onEditingComplete,
            decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.symmetric(horizontal: 10), hintText: 'Search barbers haircut ser...'),
          )),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 45, height: widget.height,
              decoration: BoxDecoration(color: const Color.fromRGBO(54, 48, 98, 1), borderRadius: BorderRadius.circular(8)),
              child: Center(child: Image.asset('images/setting.png', width: 24, height: 24)),
            ),
          ),
        ],
      ),
    ),
    );
  }
}