import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {'title': 'Order Confirmed!', 'desc': 'Your order #1869 has been confirmed.', 'time': '2 min ago', 'icon': Icons.check_circle, 'color': Colors.green},
      {'title': 'New Arrival', 'desc': 'Check out the latest bestsellers!', 'time': '1 hour ago', 'icon': Icons.new_releases, 'color': AppColors.primary},
      {'title': 'Special Offer', 'desc': 'Get 20% off on all fiction books today.', 'time': '3 hours ago', 'icon': Icons.local_offer, 'color': Colors.orange},
      {'title': 'Delivery Update', 'desc': 'Your order is out for delivery.', 'time': 'Yesterday', 'icon': Icons.local_shipping, 'color': Colors.blue},
      {'title': 'Welcome Bonus!', 'desc': 'You got ₹100 off on your first order.', 'time': '2 days ago', 'icon': Icons.card_giftcard, 'color': Colors.purple},
    ];
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(children: [
              GestureDetector(onTap: () => Navigator.pop(context), child: Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)), child: Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.textPrimary(context)))),
              const SizedBox(width: 16),
              Text('Notifications', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
              const Spacer(),
              TextButton(onPressed: () {}, child: Text('Mark all read', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600))),
            ]),
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(), padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: notifications.length, separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final n = notifications[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(AppRadius.medium)),
                  child: Row(children: [
                    Container(width: 44, height: 44, decoration: BoxDecoration(color: (n['color'] as Color).withOpacity(0.1), shape: BoxShape.circle), child: Icon(n['icon'] as IconData, color: n['color'] as Color, size: 22)),
                    const SizedBox(width: 14),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(n['title'] as String, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary(context))),
                      const SizedBox(height: 2),
                      Text(n['desc'] as String, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textSecondary(context))),
                    ])),
                    Text(n['time'] as String, style: GoogleFonts.poppins(fontSize: 10, color: AppColors.textHint(context))),
                  ]),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
