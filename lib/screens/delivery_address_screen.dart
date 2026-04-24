import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});
  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  int _selectedAddress = 0;
  final List<Map<String, String>> _addresses = [
    {'label': 'Home', 'icon': '🏠', 'address': '123 Main St, Apartment 4A\nNew Delhi, 110001', 'phone': '+91 98765 43210'},
    {'label': 'Office', 'icon': '🏢', 'address': '456 Business Park, Tower B\nGurgaon, 122002', 'phone': '+91 98765 43211'},
    {'label': 'Other', 'icon': '📍', 'address': '789 College Road, Block C\nNoida, 201301', 'phone': '+91 98765 43212'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(child: Column(children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), child: Row(children: [
          GestureDetector(onTap: () => Navigator.pop(context), child: Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)), child: Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.textPrimary(context)))),
          const SizedBox(width: 16),
          Text('Delivery Address', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
        ])),
        Expanded(child: ListView(physics: const BouncingScrollPhysics(), padding: const EdgeInsets.symmetric(horizontal: 20), children: [
          ...List.generate(_addresses.length, (i) => _buildAddressCard(i)),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(AppRadius.large), border: Border.all(color: AppColors.divider(context), style: BorderStyle.solid, width: 1.5)),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.add_circle_outline, color: AppColors.primary, size: 24),
                const SizedBox(width: 10),
                Text('Add New Address', style: GoogleFonts.poppins(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 15)),
              ]),
            ),
          ),
        ])),
      ])),
    );
  }

  Widget _buildAddressCard(int index) {
    final addr = _addresses[index];
    final isSelected = _selectedAddress == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedAddress = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBg(context),
          borderRadius: BorderRadius.circular(AppRadius.large),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.divider(context), width: isSelected ? 2 : 1),
        ),
        child: Row(children: [
          Text(addr['icon']!, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Text(addr['label']!, style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 15, color: AppColors.textPrimary(context))),
              if (index == 0) ...[const SizedBox(width: 8), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(8)), child: Text('Default', style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.primary)))],
            ]),
            const SizedBox(height: 4),
            Text(addr['address']!, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textSecondary(context))),
            const SizedBox(height: 2),
            Text(addr['phone']!, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textHint(context))),
          ])),
          Container(width: 24, height: 24, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: isSelected ? AppColors.primary : AppColors.textHint(context), width: 2)),
            child: isSelected ? Center(child: Container(width: 14, height: 14, decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary))) : null),
        ]),
      ),
    );
  }
}
