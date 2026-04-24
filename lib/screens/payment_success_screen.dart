import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/book.dart';
import 'order_tracking_screen.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final Book book;
  final double total;
  const PaymentSuccessScreen({super.key, required this.book, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.surface(context),
            borderRadius: BorderRadius.circular(24),
            boxShadow: AppShadows.softShadowDark(context),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(width: 80, height: 80, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle), child: const Icon(Icons.check, color: Colors.white, size: 50)),
            const SizedBox(height: 24),
            Text('Success !', style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primary)),
            const SizedBox(height: 16),
            Text('Your payment was successful.\nA receipt for this purchase has\nbeen sent to your email.', textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textSecondary(context), height: 1.5)),
            const SizedBox(height: 32),
            SizedBox(width: double.infinity, child: ElevatedButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OrderTrackingScreen(book: book, total: total))),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: Text('Next', style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
            )),
          ]),
        ),
      ),
    );
  }
}
