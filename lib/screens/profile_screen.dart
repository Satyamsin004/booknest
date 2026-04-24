import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../providers/theme_provider.dart';
import 'edit_profile_screen.dart';
import 'my_orders_screen.dart';
import 'delivery_address_screen.dart';
import 'payment_methods_screen.dart';
import 'notifications_screen.dart';
import 'help_support_screen.dart';
import 'about_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tp = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 100, height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.splashGradient,
                boxShadow: AppShadows.buttonShadow,
              ),
              child: Center(child: Text('S', style: GoogleFonts.poppins(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w600))),
            ),
            const SizedBox(height: 16),
            Text('Satyam', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
            Text('satyam@booknest.com', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textSecondary(context))),
            const SizedBox(height: 24),
            // Dark mode quick toggle
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                gradient: tp.isDark
                  ? const LinearGradient(colors: [Color(0xFF2A2A2A), Color(0xFF1E1E1E)])
                  : const LinearGradient(colors: [Color(0xFFFFF3E0), Color(0xFFFFE0B2)]),
                borderRadius: BorderRadius.circular(AppRadius.large),
              ),
              child: Row(children: [
                Icon(tp.isDark ? Icons.dark_mode : Icons.light_mode, color: tp.isDark ? Colors.amber : Colors.orange, size: 28),
                const SizedBox(width: 14),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(tp.isDark ? 'Dark Mode' : 'Light Mode', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.textPrimary(context))),
                  Text('Tap to switch theme', style: GoogleFonts.poppins(fontSize: 11, color: AppColors.textSecondary(context))),
                ])),
                Switch(value: tp.isDark, onChanged: (v) => tp.setDarkMode(v), activeColor: AppColors.primary),
              ]),
            ),
            _buildMenuItem(context, Icons.person_outline, 'Edit Profile', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfileScreen()));
            }),
            _buildMenuItem(context, Icons.shopping_bag_outlined, 'My Orders', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const MyOrdersScreen()));
            }),
            _buildMenuItem(context, Icons.location_on_outlined, 'Delivery Address', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const DeliveryAddressScreen()));
            }),
            _buildMenuItem(context, Icons.payment_outlined, 'Payment Methods', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentMethodsScreen()));
            }),
            _buildMenuItem(context, Icons.notifications_outlined, 'Notifications', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsScreen()));
            }),
            _buildMenuItem(context, Icons.help_outline, 'Help & Support', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpSupportScreen()));
            }),
            _buildMenuItem(context, Icons.info_outline, 'About', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutScreen()));
            }),
            const SizedBox(height: 16),
            _buildMenuItem(context, Icons.logout, 'Log Out', isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, {bool isLogout = false, VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isLogout ? AppColors.primary.withOpacity(0.05) : AppColors.cardBg(context),
        borderRadius: BorderRadius.circular(AppRadius.medium),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: isLogout ? AppColors.primary : AppColors.textSecondary(context)),
        title: Text(title, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: isLogout ? AppColors.primary : AppColors.textPrimary(context))),
        trailing: Icon(Icons.chevron_right, color: isLogout ? AppColors.primary : AppColors.textHint(context)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.medium)),
      ),
    );
  }
}
