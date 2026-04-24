import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(child: Column(children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), child: Row(children: [
          GestureDetector(onTap: () => Navigator.pop(context), child: Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)), child: Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.textPrimary(context)))),
          const SizedBox(width: 16),
          Text('Help & Support', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
        ])),
        Expanded(child: ListView(physics: const BouncingScrollPhysics(), padding: const EdgeInsets.symmetric(horizontal: 20), children: [
          // Search
          Container(
            height: 50,
            decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.divider(context))),
            child: TextField(
              style: GoogleFonts.poppins(color: AppColors.textPrimary(context)),
              decoration: InputDecoration(hintText: 'Search for help', hintStyle: GoogleFonts.poppins(color: AppColors.textHint(context), fontSize: 14), prefixIcon: Icon(Icons.search, color: AppColors.textSecondary(context)), border: InputBorder.none),
            ),
          ),
          const SizedBox(height: 24),
          // Quick Help
          Row(children: [
            _buildQuickCard(context, Icons.local_shipping_outlined, 'Track Order', Colors.blue),
            const SizedBox(width: 12),
            _buildQuickCard(context, Icons.replay_outlined, 'Returns', Colors.orange),
            const SizedBox(width: 12),
            _buildQuickCard(context, Icons.payment_outlined, 'Payments', Colors.green),
          ]),
          const SizedBox(height: 24),
          Text('FAQs', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
          const SizedBox(height: 12),
          _buildFAQ(context, 'How do I track my order?', 'You can track your order from the "My Orders" section in your profile. Tap on the active order to see real-time tracking.'),
          _buildFAQ(context, 'What is the return policy?', 'We accept returns within 7 days of delivery. The book must be in its original condition.'),
          _buildFAQ(context, 'How do I change my delivery address?', 'Go to Profile > Delivery Address to add or edit your saved addresses.'),
          _buildFAQ(context, 'Can I cancel an order?', 'You can cancel an order before it moves to "Out for delivery" status from the My Orders screen.'),
          const SizedBox(height: 24),
          Text('Contact Us', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
          const SizedBox(height: 12),
          _buildContactTile(context, Icons.email_outlined, 'Email Us', 'support@booknest.com'),
          _buildContactTile(context, Icons.phone_outlined, 'Call Us', '+91 1800 123 4567'),
          _buildContactTile(context, Icons.chat_outlined, 'Live Chat', 'Available 9AM - 9PM'),
          const SizedBox(height: 40),
        ])),
      ])),
    );
  }

  Widget _buildQuickCard(BuildContext context, IconData icon, String label, Color color) {
    return Expanded(child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(16)),
      child: Column(children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(label, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textPrimary(context))),
      ]),
    ));
  }

  Widget _buildFAQ(BuildContext context, String q, String a) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        title: Text(q, style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.textPrimary(context))),
        iconColor: AppColors.textSecondary(context),
        collapsedIconColor: AppColors.textHint(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        children: [Text(a, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textSecondary(context), height: 1.5))],
      ),
    );
  }

  Widget _buildContactTile(BuildContext context, IconData icon, String title, String sub) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: AppColors.primary, size: 22)),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary(context))),
        subtitle: Text(sub, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textSecondary(context))),
        trailing: Icon(Icons.chevron_right, color: AppColors.textHint(context)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
