import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(child: Column(children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), child: Row(children: [
          GestureDetector(onTap: () => Navigator.pop(context), child: Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)), child: Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.textPrimary(context)))),
          const SizedBox(width: 16),
          Text('Payment Methods', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
        ])),
        Expanded(child: ListView(physics: const BouncingScrollPhysics(), padding: const EdgeInsets.symmetric(horizontal: 20), children: [
          Text('My Cards', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textSecondary(context))),
          const SizedBox(height: 8),
          _buildCreditCard(context, 'Mastercard', '•••• •••• •••• 5505', '12/28', [const Color(0xFFFF6B6B), const Color(0xFFEE5A24)]),
          const SizedBox(height: 12),
          _buildCreditCard(context, 'Visa', '•••• •••• •••• 3302', '03/27', [const Color(0xFF4834d4), const Color(0xFF686de0)]),
          const SizedBox(height: 24),
          Text('Other Payment Methods', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textSecondary(context))),
          const SizedBox(height: 12),
          _buildPaymentOption(context, Icons.account_balance, 'UPI Payment', 'Pay via any UPI app'),
          _buildPaymentOption(context, Icons.money, 'Cash on Delivery', 'Pay when you receive'),
          _buildPaymentOption(context, Icons.card_giftcard, 'Gift Cards', 'Redeem BookNest gift cards'),
          const SizedBox(height: 24),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(AppRadius.large), border: Border.all(color: AppColors.divider(context), width: 1.5)),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.add_circle_outline, color: AppColors.primary, size: 22),
                const SizedBox(width: 10),
                Text('Add New Card', style: GoogleFonts.poppins(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 15)),
              ]),
            ),
          ),
          const SizedBox(height: 40),
        ])),
      ])),
    );
  }

  Widget _buildCreditCard(BuildContext context, String type, String number, String expiry, List<Color> gradient) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: gradient), borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: gradient.first.withOpacity(0.4), blurRadius: 15, offset: const Offset(0, 8))]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(type, style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.8), fontSize: 14, fontWeight: FontWeight.w500)),
          Icon(type == 'Mastercard' ? Icons.circle : Icons.credit_card, color: Colors.white, size: 30),
        ]),
        const SizedBox(height: 24),
        Text(number, style: GoogleFonts.poppins(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 2)),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Card Holder', style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.6), fontSize: 10)),
            Text('SATYAM', style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('Expires', style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.6), fontSize: 10)),
            Text(expiry, style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
          ]),
        ]),
      ]),
    );
  }

  Widget _buildPaymentOption(BuildContext context, IconData icon, String title, String sub) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: AppColors.primary, size: 22)),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary(context))),
        subtitle: Text(sub, style: GoogleFonts.poppins(fontSize: 11, color: AppColors.textHint(context))),
        trailing: Icon(Icons.chevron_right, color: AppColors.textHint(context)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
