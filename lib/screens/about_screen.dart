import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(child: Column(children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), child: Row(children: [
          GestureDetector(onTap: () => Navigator.pop(context), child: Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)), child: Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.textPrimary(context)))),
          const SizedBox(width: 16),
          Text('About', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
        ])),
        Expanded(child: ListView(physics: const BouncingScrollPhysics(), padding: const EdgeInsets.symmetric(horizontal: 20), children: [
          const SizedBox(height: 20),
          Center(child: Container(
            width: 100, height: 100,
            decoration: BoxDecoration(gradient: AppColors.splashGradient, borderRadius: BorderRadius.circular(24), boxShadow: AppShadows.buttonShadow),
            child: const Icon(Icons.menu_book_rounded, size: 50, color: Colors.white),
          )),
          const SizedBox(height: 16),
          Center(child: Text('BookNest', style: GoogleFonts.pacifico(fontSize: 32, color: AppColors.primary))),
          Center(child: Text('Version 1.0.0', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textSecondary(context)))),
          const SizedBox(height: 8),
          Center(child: Text('Your cozy corner for books', style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textHint(context)))),
          const SizedBox(height: 32),
          _buildTile(context, Icons.description_outlined, 'Terms of Service'),
          _buildTile(context, Icons.privacy_tip_outlined, 'Privacy Policy'),
          _buildTile(context, Icons.star_outline, 'Rate Us'),
          _buildTile(context, Icons.share_outlined, 'Share App'),
          _buildTile(context, Icons.code_outlined, 'Open Source Licenses'),
          const SizedBox(height: 32),
          Center(child: Column(children: [
            Text('Made with ❤️ by Satyam', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textSecondary(context))),
            const SizedBox(height: 4),
            Text('© 2026 BookNest. All rights reserved.', style: GoogleFonts.poppins(fontSize: 11, color: AppColors.textHint(context))),
          ])),
          const SizedBox(height: 40),
        ])),
      ])),
    );
  }

  Widget _buildTile(BuildContext context, IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: AppColors.textSecondary(context), size: 22),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.textPrimary(context))),
        trailing: Icon(Icons.chevron_right, color: AppColors.textHint(context)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
