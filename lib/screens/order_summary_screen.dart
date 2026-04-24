import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/book.dart';
import 'payment_success_screen.dart';
import 'order_tracking_screen.dart';

class OrderSummaryScreen extends StatefulWidget {
  final Book book;
  const OrderSummaryScreen({super.key, required this.book});
  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  int _selectedPayment = 0;
  bool _saveCard = true;
  double get taxes => 29.0;
  double get deliveryFee => 35.0;
  double get total => widget.book.price + taxes + deliveryFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface(context),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back, size: 24, color: AppColors.iconColor(context))),
              Icon(Icons.search, size: 24, color: AppColors.iconColor(context)),
            ]),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(height: 8),
                Text('Order summary', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
                const SizedBox(height: 24),
                _buildSummaryRow('Order', 'Rs ${widget.book.price.toStringAsFixed(2)}'),
                _buildSummaryRow('Taxes', 'Rs ${taxes.toStringAsFixed(0)}'),
                _buildSummaryRow('Delivery fees', 'Rs ${deliveryFee.toStringAsFixed(0)}'),
                Divider(height: 32, color: AppColors.divider(context)),
                _buildSummaryRow('Total:', 'Rs ${total.toStringAsFixed(2)}', isBold: true),
                const SizedBox(height: 8),
                _buildSummaryRow('Estimated delivery time:', '15 - 30mins', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textSecondary(context))),
                const SizedBox(height: 32),
                Text('Payment methods', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimary(context))),
                const SizedBox(height: 16),
                _buildPaymentCard(index: 0, icon: Icons.credit_card, iconColor: AppColors.mastercard, label: 'Credit card', number: '5105 **** **** 0505', bgColor: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF2A2218) : const Color(0xFFFFF3E0)),
                const SizedBox(height: 12),
                _buildPaymentCard(index: 1, icon: Icons.credit_card, iconColor: AppColors.visa, label: 'Debit card', number: '3566 **** **** 0505', bgColor: AppColors.cardBg(context)),
                const SizedBox(height: 20),
                Row(children: [
                  GestureDetector(
                    onTap: () => setState(() => _saveCard = !_saveCard),
                    child: Container(width: 22, height: 22, decoration: BoxDecoration(color: _saveCard ? AppColors.primary : Colors.transparent, borderRadius: BorderRadius.circular(4), border: Border.all(color: _saveCard ? AppColors.primary : AppColors.textHint(context), width: 2)),
                      child: _saveCard ? const Icon(Icons.check, color: Colors.white, size: 16) : null),
                  ),
                  const SizedBox(width: 10),
                  Text('Save card details for future payments', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textSecondary(context))),
                ]),
                const SizedBox(height: 32),
              ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            decoration: BoxDecoration(color: AppColors.surface(context), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))]),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Total price', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textSecondary(context))),
                Text('Rs ${total.toStringAsFixed(2)}', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.primary)),
              ]),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentSuccessScreen(book: widget.book, total: total))),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  decoration: BoxDecoration(color: AppColors.darkBg(context), borderRadius: BorderRadius.circular(AppRadius.round)),
                  child: Text('Pay Now', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false, TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: style ?? GoogleFonts.poppins(fontSize: isBold ? 15 : 14, fontWeight: isBold ? FontWeight.w600 : FontWeight.w400, color: AppColors.textPrimary(context))),
        Text(value, style: style ?? GoogleFonts.poppins(fontSize: isBold ? 15 : 14, fontWeight: isBold ? FontWeight.w600 : FontWeight.w400, color: AppColors.textPrimary(context))),
      ]),
    );
  }

  Widget _buildPaymentCard({required int index, required IconData icon, required Color iconColor, required String label, required String number, required Color bgColor}) {
    final isSelected = _selectedPayment == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedPayment = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(AppRadius.large), border: isSelected ? Border.all(color: AppColors.primary.withOpacity(0.5), width: 1.5) : null),
        child: Row(children: [
          Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.surface(context), borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: iconColor, size: 24)),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary(context))),
            Text(number, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textSecondary(context))),
          ])),
          Container(width: 24, height: 24, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: isSelected ? AppColors.primary : AppColors.textHint(context), width: 2)),
            child: isSelected ? Center(child: Container(width: 14, height: 14, decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary))) : null),
        ]),
      ),
    );
  }
}
