import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _biometric = false;
  bool _promotions = true;

  @override
  Widget build(BuildContext context) {
    final tp = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(children: [
              GestureDetector(onTap: () => Navigator.pop(context),
                child: Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)), child: Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.textPrimary(context)))),
              const SizedBox(width: 16),
              Text('Settings', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
            ]),
          ),
          Expanded(
            child: ListView(physics: const BouncingScrollPhysics(), padding: const EdgeInsets.symmetric(horizontal: 20), children: [
              const SizedBox(height: 8),
              Text('General', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textSecondary(context))),
              const SizedBox(height: 12),
              _buildSwitch('Push Notifications', 'Get updates on your orders', Icons.notifications_outlined, _notifications, (v) => setState(() => _notifications = v)),
              _buildSwitch('Dark Mode', 'Switch to dark theme', Icons.dark_mode_outlined, tp.isDark, (v) => tp.setDarkMode(v)),
              _buildSwitch('Biometric Login', 'Use fingerprint to login', Icons.fingerprint, _biometric, (v) => setState(() => _biometric = v)),
              _buildSwitch('Promotional Emails', 'Receive offers & deals', Icons.mail_outline, _promotions, (v) => setState(() => _promotions = v)),
              const SizedBox(height: 24),
              Text('App', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textSecondary(context))),
              const SizedBox(height: 12),
              _buildTile(Icons.language, 'Language', 'English'),
              _buildTile(Icons.location_on_outlined, 'Region', 'India'),
              _buildTile(Icons.storage_outlined, 'Clear Cache', ''),
              const SizedBox(height: 24),
              Text('Account', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textSecondary(context))),
              const SizedBox(height: 12),
              _buildTile(Icons.lock_outline, 'Change Password', ''),
              _buildTile(Icons.delete_outline, 'Delete Account', '', isDestructive: true),
              const SizedBox(height: 40),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _buildSwitch(String title, String sub, IconData icon, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Icon(icon, color: AppColors.textSecondary(context), size: 22),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.textPrimary(context))),
          Text(sub, style: GoogleFonts.poppins(fontSize: 11, color: AppColors.textHint(context))),
        ])),
        Switch(value: value, onChanged: onChanged, activeColor: AppColors.primary),
      ]),
    );
  }

  Widget _buildTile(IconData icon, String title, String trailing, {bool isDestructive = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: isDestructive ? AppColors.primary.withOpacity(0.05) : AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: isDestructive ? AppColors.primary : AppColors.textSecondary(context), size: 22),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: isDestructive ? AppColors.primary : AppColors.textPrimary(context))),
        trailing: trailing.isNotEmpty
          ? Text(trailing, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textHint(context)))
          : Icon(Icons.chevron_right, color: isDestructive ? AppColors.primary : AppColors.textHint(context)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
