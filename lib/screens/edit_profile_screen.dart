import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'settings_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
              IconButton(icon: const Icon(Icons.settings, color: Colors.white), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()))),
            ]),
          ),
          Expanded(
            child: Stack(clipBehavior: Clip.none, children: [
              Container(
                margin: const EdgeInsets.only(top: 60),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surface(context),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 80, bottom: 40),
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    _buildTextField(context, 'Name', 'Satyam'),
                    const SizedBox(height: 16),
                    _buildTextField(context, 'Email', 'satyam@booknest.com'),
                    const SizedBox(height: 16),
                    _buildTextField(context, 'Delivery address', '123 Main , St Apartment 4A,New Delhi,'),
                    const SizedBox(height: 16),
                    _buildTextField(context, 'Password', '••••••••', isPassword: true),
                    const SizedBox(height: 32),
                    Divider(color: AppColors.divider(context)),
                    const SizedBox(height: 16),
                    _buildListTile(context, 'Payment Details'),
                    _buildListTile(context, 'Order history'),
                    const SizedBox(height: 40),
                    Row(children: [
                      Expanded(child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_square, color: Colors.white, size: 18),
                        label: Text('Edit Profile', style: GoogleFonts.poppins(color: Colors.white)),
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkBg(context), padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      )),
                      const SizedBox(width: 16),
                      Expanded(child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.logout, color: AppColors.primary, size: 18),
                        label: Text('Log out', style: GoogleFonts.poppins(color: AppColors.primary)),
                        style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.primary, width: 1.5), padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      )),
                    ]),
                  ]),
                ),
              ),
              Positioned(top: 0, left: 0, right: 0, child: Center(
                child: Container(
                  width: 120, height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.surface(context),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
                  ),
                  child: Stack(alignment: Alignment.center, children: [
                    Icon(Icons.auto_stories, size: 60, color: AppColors.primary),
                  ]),
                ),
              )),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label, String value, {bool isPassword = false}) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: AppColors.textSecondary(context), fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.divider(context))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.divider(context))),
      ),
      child: Row(children: [
        Expanded(child: Text(value, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary(context), letterSpacing: isPassword ? 2 : 0))),
        if (isPassword) Icon(Icons.lock_outline, size: 16, color: AppColors.textHint(context)),
      ]),
    );
  }

  Widget _buildListTile(BuildContext context, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textSecondary(context))),
      trailing: Icon(Icons.chevron_right, color: AppColors.textHint(context)),
      onTap: () {},
    );
  }
}
