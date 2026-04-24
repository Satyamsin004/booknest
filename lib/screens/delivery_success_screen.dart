import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'main_screen.dart';

class DeliverySuccessScreen extends StatelessWidget {
  const DeliverySuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface(context),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.cardBg(context),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))],
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(width: 80, height: 80, decoration: const BoxDecoration(color: Color(0xFF34C759), shape: BoxShape.circle), child: const Icon(Icons.check, color: Colors.white, size: 50)),
            const SizedBox(height: 16),
            Text('Congratulations!!', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF34C759))),
            const SizedBox(height: 24),
            Text('Your Order has been delivered', textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary(context))),
            const SizedBox(height: 24),
            Container(width: 60, height: 60, decoration: const BoxDecoration(color: Color(0xFF34C759), shape: BoxShape.circle), child: const Icon(Icons.local_activity_outlined, color: Colors.white, size: 30)),
            const SizedBox(height: 16),
            Text('you have earned a coupon', textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary(context))),
            const SizedBox(height: 32),
            SizedBox(width: double.infinity, child: ElevatedButton(
              onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const MainScreen()), (route) => false),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: Text('BUY AGAIN!!', style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
            )),
          ]),
        ),
      ),
    );
  }
}
