import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SizeSelector extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;
  const SizeSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ['S', 'M', 'L'].map((s) {
        final isSelected = s == selected;
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(s),
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFFFF3E6) : Colors.white,
                border: Border.all(
                  color: isSelected ? AppColors.button : Colors.black12,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                s,
                style: TextStyle(
                  color: isSelected ? AppColors.button : AppColors.dark,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
