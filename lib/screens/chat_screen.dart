import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: AppBar(
        backgroundColor: AppColors.surface(context),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: AppColors.iconColor(context)), onPressed: () {}),
        title: Text('26 minutes ago', style: GoogleFonts.poppins(color: AppColors.textHint(context), fontSize: 12)),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.menu, color: AppColors.iconColor(context)), onPressed: () {})],
      ),
      body: Column(children: [
        Expanded(
          child: ListView(padding: const EdgeInsets.all(20), children: [
            _buildAgentMessage(context, 'Hi, how can I help you?'),
            const SizedBox(height: 16),
            _buildUserMessage(context, 'Hello, I\'m looking for the book "The Psychology of Money" by Morgan Housel.\nIt\'s not showing in your catalog. Can I still order it?'),
            const SizedBox(height: 16),
            _buildAgentMessage(context, 'Ok, please let me check!'),
            const SizedBox(height: 16),
            _buildUserMessage(context, 'Sure...'),
            const SizedBox(height: 16),
            _buildAgentMessage(context, 'Yes, we can place a custom order for "The Psychology of Money". May I have your delivery address?'),
            const SizedBox(height: 16),
            _buildUserMessage(context, 'Sure! 123, Green Avenue,\nCity Center, New Delhi -\n110001'),
            const SizedBox(height: 16),
            _buildAgentMessage(context, 'Thank you! Your order has been placed successfully.'),
          ]),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          color: AppColors.surface(context),
          child: Row(children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: AppColors.inputFill(context), borderRadius: BorderRadius.circular(24)),
                child: TextField(
                  style: GoogleFonts.poppins(color: AppColors.textPrimary(context)),
                  decoration: InputDecoration(hintText: 'Type here...', hintStyle: GoogleFonts.poppins(color: AppColors.textHint(context), fontSize: 14), border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 50, height: 50,
              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(16), boxShadow: AppShadows.buttonShadow),
              child: const Icon(Icons.send, color: Colors.white, size: 20),
            ),
          ]),
        ),
      ]),
    );
  }

  Widget _buildAgentMessage(BuildContext context, String text) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.darkBg(context), shape: BoxShape.circle), child: const Icon(Icons.person, color: Colors.white)),
      const SizedBox(width: 12),
      Flexible(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardBg(context),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
          child: Text(text, style: GoogleFonts.poppins(color: AppColors.textPrimary(context), fontSize: 14)),
        ),
      ),
      const SizedBox(width: 40),
    ]);
  }

  Widget _buildUserMessage(BuildContext context, String text) {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.end, children: [
      const SizedBox(width: 40),
      Flexible(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
            boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))],
          ),
          child: Text(text, style: GoogleFonts.poppins(color: Colors.white, fontSize: 14)),
        ),
      ),
      const SizedBox(width: 12),
      Container(width: 40, height: 40, decoration: BoxDecoration(color: Colors.blue.shade100, shape: BoxShape.circle), child: const Icon(Icons.face, color: Colors.blue)),
    ]);
  }
}
