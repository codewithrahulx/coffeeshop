import 'package:flutter/material.dart';
import '../models/coffee.dart';
import '../utils/app_colors.dart';
import 'coffee_card.dart';

class CoffeeGrid extends StatelessWidget {
  final List<Coffee> items;
  final String emptyText;
  const CoffeeGrid({super.key, required this.items, this.emptyText = 'No coffee found'});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(child: Text(emptyText, style: const TextStyle(color: AppColors.grey)));
    }
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (_, i) => CoffeeCard(coffee: items[i]),
    );
  }
}