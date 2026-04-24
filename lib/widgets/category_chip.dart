import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({super.key, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.chipActive : AppColors.chipInactive(context),
          borderRadius: BorderRadius.circular(AppRadius.round),
          border: Border.all(color: isSelected ? AppColors.chipActive : AppColors.chipBorder(context), width: 1.5),
          boxShadow: isSelected ? AppShadows.buttonShadow : null,
        ),
        child: Center(
          child: Text(label, style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? Colors.white : AppColors.textSecondary(context),
          )),
        ),
      ),
    );
  }
}
